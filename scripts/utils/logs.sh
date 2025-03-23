#!/usr/bin/env bash
set -o nounset -o pipefail

# Configuration section 
LOG_LEVEL=${LOG_LEVEL:-"INFO"}  # Allow environment variable override
LOG_DIR="${PWD}/logs"
LOG_FILE="${LOG_DIR}/kubernetes-binary-install.log"
MAX_LOG_SIZE=20485760  # 20MB

# Initialize log directory
mkdir -p "${LOG_DIR}"

# Sensitive word filter list
SENSITIVE_KEYS=("password" "token" "secret")

sanitize() {
  local msg=$1
  for key in "${SENSITIVE_KEYS[@]}"; do
    msg=$(echo "${msg}" | sed -E "s/(${key}=)[^&]*/\1***/gi")
  done
  echo "${msg}"
}

log() {
  local level=$1
  local msg=$2
  declare -A log_levels=([DEBUG]=0 [INFO]=1 [WARN]=2 [ERROR]=3)
  [[ ${log_levels[$level]} ]] || level="INFO"
  
  # Level determination
  (( ${log_levels[$level]} >= ${log_levels[$LOG_LEVEL]} )) || return 0
  
  # Log rotation
  if [[ -f "${LOG_FILE}" && $(stat -c %s "${LOG_FILE}") -gt ${MAX_LOG_SIZE} ]]; then
    mv "${LOG_FILE}" "${LOG_FILE}.$(date +%Y%m%d%H%M%S)"
    touch "${LOG_FILE}"
  fi

  # Construct log content
  local sanitized_msg=$(sanitize "${msg}")
  local context="[User: $(whoami)@$(hostname -I | awk '{print $1}')]"
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] ${context} [${level}] ${sanitized_msg}" >> "${LOG_FILE}"
  
  # Synchronous output to standard error (ERROR level)
  if [[ $level == "ERROR" ]]; then
    echo "[!] ERROR: ${sanitized_msg}" >&2
  fi
}

error_exit() {
  local msg=$1
  local code=${2:-1}
  log "ERROR" "${msg}"
  exit $code
}
