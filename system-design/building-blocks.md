# Building Blocks of Distributed Systems

## Load Balancer (LB)

Helps spread traffic across a cluster of servers. if server is unavailable, LB will route to different server

- improve responsiveness
- improve availability
- keeps track of status of resources while distributing requests
- Balances requests across backend servers reducing individual server/application load and prevents single point of failure
- improves availability and responsiveness

### Example

Load balancers can be added in three places

![where to add](images/lb2.webp)

- between user and web server
- between web servers and internal platform layer
  - application server or cache server
- between internal platform layer and database

### Benefits

- Faster user experience
  - requests passed to more available resource
- Less service provider downtime
  - in full server failure, LB routes to healthy server
- Easier for sys admins to handle incoming requests while decreasing wait time for users
- Smart LB provide predictive analytics
  - traffic bottlenecks
  - actionable insights
  - key to automation
  - can help drive business decisions
- Fewer failed or stressed components. Several devices performing little work

### Redundant LB

Each LB monitors the other (possibly via heartbeats?). in the even of a failure, the other takes over.

### Algorithms

Consider factors such as server capacity, active connections, response times and server health on how best to distribute requests

#### Round Robin

distribute requests in a cyclic order

- Pros
  - equal distribution in fixed order
  - easy to implement and understand
  - works well when servers are similar
- Cons
  - no load awareness
  - no session affinity for stateful applications
  - performance issues with different capacities
  - predictable distribution pattern (ie security flaw)
- Use Cases
  - homoeneous environments
  - stateless applications

#### Least Connections

dynamic load balancing, assigning requests to server with fewest active connections

- Pros
  - load awareness (better utilization of resources)
  - dynamic distribution
  - efficiency in heterogeneous environments
- Cons
  - higher complexity
  - state maintenance
  - potential for connection spikes (in cases where connection duration is short)
- Use Cases
  - heterogeneous environments
  - variable traffic patterns
  - stateful applications

#### Weighted Round Robin

Enhanced round robin giving more powerfull servers a greater weight

- Pros
  - load distribution according to capacity - better utilization of resources
  - flexibility - ability to change based on server capacities or new servers
  - improved performance - helps optimize overall system performance
- Cons
  - complexity in weight assignment - requires accurate performance metrics
  - increased overhead - managing weights where server performance fluctuates
  - not idea for highly variable loads - doesn't consider real-time server load
- Use Cases
  - heterogeneous server environments
  - scalable web applications - different servers may have varying performance
  - database clusters - some nodes can handle more queries

#### Weighted Least Connections

Combination of weighted round robin and least connections so you get both the current load and the relative capacity of each server

- Pros
  - dynamic load balancing - adjusts with real time load on server
  - capacity awareness - better utilization of resources
  - flexibility - handles heterogeneous servers and variable load
- Cons
  - complexity - more complex to implement
  - state maintenance - load balancer must keep track of active connections and server weights
  - weight assignment - requires accurate performance metrics
- Use Cases
  - heterogeneous server environments - servers have different processing capacities
  - high traffic web applicatoins - variable traffic patters
  - database clusters - nodes can have varying performance and query loads

#### IP Hash

Creates a hash of the ip address ans routes to a specific server. For example if the hash of the ip addresss % 3 were == 2 then it would go to the second server.

- Pros
  - session persistence - same client always goes to the same server
  - simplicity - easy to implement
  - deterministic - predictable routing
- Cons
  - uneven distribution - if ip addresses are not evenly distributed some servers may get more requests
  - dynamic changes - adding or removing servers can disrupt hash mapping
  - limited flexibility - does not take into account current load
- Use Cases
  - stateful applications - ideal where maintaining session persistence is important (online shopping carts or user sessions)
  - geographically distributed clients - clients are distributed across different regions and consistent routing is required

#### Least Response TIme

Dynamically assign incoming requests to the server with the most recent lowest response time.

- monitor response times from when request is sent to response is received
- assign requests to server with lowest response time
- dynamically adjusts assignment of requests based on real-time performance

- Pros
  - optimized performance - fastest available server - reduced latency and improved client experience
  - dynamic load balancing - ensures optimal load distribution
  - effective resource utilization - directs traffic to servers that can respond quickly
- Cons
  - complexity - requires continuous monitoring of server performance
  - overhead - monitoring and dynamically adjusting load can introduce additional overhead
  - short-term variability - network fluctuations or transient server issues can potentially cause frequent rebalancing
- Use Cases
  - real-time applications - applications where low latency/fast response are critical (online gaming, video streaming, financial trading)
  - web services - need quick responses to user requests
  - dynamic environments - fluctuation loads and varying server performance

#### Random

Simple and effective where the load is relatively uniform and servers have similar capacities. If randomness is uniform each server should eventually receive the same number of requests

- Pros
  - simplicity - easy to implement and minimal config
  - no state maintenance - doesn't need to track state or performance of servers reducing overhead
  - uniform distribution over time
- Cons
  - no load awareness - could lead to uneven distribution if server performance varies
  - potential for imbalance - uneven in the short term
  - no session affinity - requests from same client could be routed to different servers
  - more challenging security - detecting anomalies is more challenging to identify malicious patterns due to inherent unpredictability is request distribution
- Use Cases
  - homogeneous environments - where servers have similar capacity and performance
  - stateless applications - works well where each request can be handled independently
  - simple deployments - ideal where complex load balancing is not justified
  -
