# Caching

Load balancing helps you scale horizontally across servers but caching helps you make better use of resources you already have as well as making otherwise unatainable product requriements feasible.

Locality of reference principle: recently requested data is likely to be requested again

Used in every computing layer:

- hardware
- operating systems
- web browsers
- web applications
- more

## What is Caching

High speed storage layer that sits between the application and the original source of the data (database, file system, remote web service). When the data is requested by the application it's first checked in the cache. if the data is not found it is retrieved from the original source and then stored in the cache for future use.

The goal is to reduce the number of times data is fetched from the original source.

Results in faster processing and reduced latency

- in-memory caching
- disk caching
- database caching
- CDN caching

### Terminology

- **Cache:** temporary storage location for data or computation results, typically for fast access and retrieval
- **Cache Hit:** requested data or computation result is found in the cache
- **Cache Miss:** requested data or computation result is not found in the cache and needs to be retrieved from the original source or recomputated
- **Cache Eviction:** removing data from the cache typically to make room for new data or a predefined cache eviction policy
- **Cache Staleness:** when data in the cache is outdated compared to the original data source

## Types of Caching

![Cache Types](images/cache-types.webp)

1. In-Memory Caching: stored data on the local main memory of the computer, faster to access than disk for data that can fit into memory.
   1. Commonly used for API responses, session data, web page fragments.
   2. Implemented using a cache library liek `Memcached` or `Redis` or implementing custom caching logic within the application code
2. Disk Caching: slower than in-memory but faster than retrieving from a remote data source.
   1. Useful for data that is too large to fit in memory or if data needs to persist in between application restarts.
   2. caching databse queries and file system data
3. Database Caching: stores frequently accessed data in the database itself
   1. Useful for data that is stored in the database and accessed by multiple users
   2. implemented in a variety of techniques including `database query caching` and `result set caching`
4. Client-side Caching: occurs on the client side such as web browser or mobile app
   1. stores frequently accessed data like images, CSS or javascript files
   2. browser caching or local storage
5. Server-side Caching: Typically in web applications or other backend systems
   1. store frequently accessed data, precomputed results, or intermediate processing results to improve performance of the server
   2. examples include full-page caching, fragment caching, object caching
6. CDN Caching: stores data on a distributed network of servers , reducing latency from remote locations
   1. useful for data accessed from multiple locations around the world; images, videos, other static assets
   2. commonly used for content delivery networks and large-scale web applications
7. DNS Caching: stores results of DNS queries for a period of time. user tries to resolve website's domain name to IP address. DNS server response with the IP address and user can access website through IP Address.
   1. Request for domain name, DNS server first goes to the cache, can then respond without having to query other serviers for the IP address
   2. can significantly reduce response time for DNS queries and improve overall system performance

## Cache Invalidation

Caching can improve performance, still need to ensure data in the cache is correct, otherwise we serve stale information.

1. Ensure Data freshness:
   1. when underlying data changes, you must mark or remove old cached data so users don't see stale information
   2. without invalidation cache will continue to serve outdated data and lead to inconsistencies
2. Maintain System Consistency:
   1.
