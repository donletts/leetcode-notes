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
  - load distribution according to capacity
  - flexibility
  - improved performance
- Cons
  - complexity in weight assignment
  - increased overhead
  - not idea for highly variable loads
-
