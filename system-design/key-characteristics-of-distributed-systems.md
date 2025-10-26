# Key Characteristics of Distributed Systems

- Scalability
- Reliability
- Availability
- Efficiency
- Manageability

## Scalability

- ability of a system/process/network to grow and manage increased demand without performance loss
  - increased data volume
  - increased amount of work
- generally performance declines with system size
  - management cost
  - environment cost
- scalable system attempts to balance load on all nodes evenly

### Horizontal Scaling

- add more servers
- easier to scale dynamically by adding more systems to the pool
- Cassandra and MongoDB

### Vertical Scaling

- add more power to each server
- limited by capacity of single server
- scaling beyond that capacity involves downtime and has upper limit
- MySql would need to just get a bigger machine

## Reliability

- ability of a system to continue running in the presence of faults, errors or failures
- a distributed system is considered reliable if it can continue delivering services when one or several of it's software or hardware components fail
- reliability is one of the main characteristics of a distributed system since any failing machine can be replaced by another healthy one to ensure the completion of the task
- Ex: Amazon, any user transaction should never be canceled due to failure of a machine
- redundancy has a cost
- fault tolerance is the system's ability to continue operating (possibly at reduced level) despite component failures

### Reliability vs Fault Tolerance

- Scope
  - Reliability focuses on end to end correctness and consistency of the entire system
  - Fault Tolerance focuses on systems ability to continue operating when individual components fail
- Perspective
  - reliability is a user-centric concept
  - fault tolerance is a system-centric concept
- Measurement
  - reliability is measured in uptime, error rates and mean time between failures (MTBF)
  - fault tolerance is measured by how quickly and effectively the system detects, isolates and recovers from failures (ex. failover times)

## Availability

- time a system remains operational in a specific period
- percentage of time that a system, service, or machine remains operational under normal conditions
- takes into account
  - maintainability
  - repair time
  - spares availability
  - logistics considerations
- Reliability is Availability over time
- if a system is reliable it is available but if a system is available it is not necessarily reliable
  - minimize repair time
  - ensure spares are always available
- Ex. consider an online retail store that has security vulnerabilities that haven't been exploited yet. Available but not reliable

## Efficiency

two standard measures of the efficiency of a distributed system

- response time (or latency)
  - which denotes the delay to obtain the first item
- throughput (or bandwidth)
  - denotes number of items

These two measures correspond to the following unit costs

- number of messages globally sent by nodes of the system regardless of size
- size of messages representing the volume of data

a precise cost model taking into account all performance factors is too difficult so we use this is a rough but robust model of efficiency. it doesn't take into account the following

- network topology
- network load and it's variation
- possible heterogeneity of software and hardware components involved in data processing and routing

## Serviceability or Manageability

how easy is it to operate maintain

- the simplicity and speed with which a system can be repaired or maintained
  - if time to fix increases, availability decreases
- Things to consider
  - ease of diagnosing and understanding problems
  - ease of making updates or modifications
  - how simple the system is to operate
    - does it routinely operate without failure or exceptions?
- early detection of faults decrease or avoid system downtime
  - automatically calling a service center when fault detected
-
