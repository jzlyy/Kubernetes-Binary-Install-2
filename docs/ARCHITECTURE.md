%%{init: {'theme': 'forest', 'themeVariables': { 'fontSize': '12px'}}}%%
graph TD
    subgraph External Access Layer
        A[Cloud LB] -->|TCP 6443| B[Nginx VIP]
    end

    subgraph Control Plane
        B --> C[Master1: kube-apiserver]
        B --> D[Master2: kube-apiserver]
    end

    subgraph Distributed Storage Layer
        C --> F[etcd1]
        D --> G[etcd2]
        E --> H[etcd3]
        F <-. Trunked communication .-> G
        G <-. Trunked communication .-> H
        H <-. Trunked communication .-> F
    end

    subgraph Worker Nodes
        I[Worker1] -->|kubelet| C
        I -->|kubelet| D
        I -->|kubelet| E
        J[Worker2] -->|kubelet| C
        J -->|kubelet| D
        J -->|kubelet| E
    end

    subgraph Network Plane
        K[Calico Pod Network] -->|BGP| L[Physical switch]
        M[MetalLB] -->|ARP/NDP| N[Worker Nodes]
    end

    subgraph Additional Components
        O[Keepalived] -->|VRRP| P[Nginx]
        Q[Prometheus] -->|Monitoring data| R[Alertmanager]
        S[Grafana] -->|Dashboard| Q
    end

## High Availability Assurance Mechanisms

1. **API Server Layer**
   - Implement 4-layer load balancing via Nginx VIP
   - Independent and stateless deployment for each API Server

2. **etcd Cluster**
   - Ensure data consistency through the Raft protocol
   - Regular snapshots and WAL log persistence

3. **Network Architecture**
   - Pod-level network policies enforced by Calico
   - BGP mode integration with physical network devices

4. **Fault Recovery**
   - Real-time Nginx health monitoring via Keepalived
   - Automatic VIP migration upon node failure
