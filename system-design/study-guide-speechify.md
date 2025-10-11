# System Design Overview

## **Introduction to System Design**

- **Importance of System Design**: System design is a crucial aspect of software engineering, impacting long-term performance and scalability.

- **Role in Career Development**: Mastery of system design is essential for securing roles in top tech firms and startups.

- **Interview Expectations**: Candidates are evaluated on their ability to gather requirements, understand trade-offs, consider edge cases, and articulate their thought processes clearly.

## **Collecting Requirements**

### **Functional Requirements**

- **Definition**: Functional requirements outline the features of a system from the user's perspective.

- **Example Scenario**: Designing an application like Instagram requires focusing on core components such as:
  - **User Feed**: Ability for users to scroll through posts without running out.
  - **Account Management**: Implementing account creation and authentication.
  - **Content Moderation**: Ensuring that users do not see posts from blocked accounts.

### **Non-Functional Requirements**

- **Definition**: Non-functional requirements focus on system performance aspects, such as scalability, availability, and security.

- **Gathering Methods**: Ask targeted questions to clarify expectations regarding:
  - **Scale**: Number of users or requests per second.
  - **Latency**: Expected response time for users.
  - **Availability**: Tolerance for downtime.

## **Core Components of System Design**

### **Client/Server Model**

- **Basic Structure**: The client-server model separates the application into two roles, facilitating communication between clients and servers.

- **Distributed Systems**: In large-scale applications, multiple clients interact with several servers, managed by load balancers.

### **Stateless vs Stateful Services**

- **Stateless Services**: Do not retain user data between requests, allowing for easier scaling and recovery.

- **Stateful Services**: Retain user data, which complicates scaling but can enhance performance for specific applications.

### **Databases**

- **Importance of Database Selection**: Choosing the right database is critical for data storage, retrieval, and overall system performance.

- **CAP Theorem**: In distributed systems, one can only guarantee two of the following three attributes:

  - **Consistency**: All reads return the latest write.
  - **Availability**: Every request gets a response.
  - **Partition Tolerance**: The system operates despite network failures.

- **Types of Databases**:
  - **Relational Databases**: Ideal for applications needing strong data integrity (e.g., PostgreSQL).
  - **Key-Value Stores**: Fast and simple for caching and session management (e.g., DynamoDB).
  - **Document Stores**: Flexible schema suitable for content platforms (e.g., MongoDB).
  - **Wide-Column Stores**: Efficient for sparse data and high write throughput (e.g., Cassandra).
  - **Graph Databases**: Designed for traversing relationships (e.g., Neo4j).

### **Caching**

- **Purpose of Caching**: Reduces latency and database load by temporarily storing frequently accessed data.

- **Cache Invalidation**: Critical to ensure that stale data is removed or updated.

- **Caching Strategies**:
  - **Time To Live (TTL)**: Evicts data after a set period.
  - **Write-Through Cache**: Updates both cache and database simultaneously.
  - **Write-Behind Cache**: Writes to the cache first, then asynchronously to the database.

### **Queues**

- **Role of Queues**: Manage spikes in traffic and build resilience by processing requests asynchronously.

- **Benefits of Using Queues**:
  - **Graceful Handling of Traffic**: Prevents request drops during high load.
  - **Independent Scaling**: Allows producers and consumers to operate without overloading each other.

## **Scaling Strategies**

### **Vertical Scaling**

- **Definition**: Increasing the resources of a single machine (e.g., more CPU, RAM).

- **Limitations**: Faces constraints related to hardware capabilities and introduces a single point of failure.

### **Horizontal Scaling**

- **Definition**: Adding more machines to handle increased load.

- **Advantages**:
  - **Infinite Scalability**: Can add more machines as needed.
  - **Improved Reliability**: Redundant machines ensure service continuity.

## **Trade-Offs in System Design**

### **Consistency vs Availability**

- **Trade-Off Explanation**: The CAP theorem illustrates the balance between consistency and availability during network partitions.

- **When to Prioritize Consistency**: Financial transactions, user permissions, and inventory systems.

- **When to Prioritize Availability**: News feeds, caches, and analytics systems.

### **Latency vs Durability**

- **Latency**: Refers to the speed of responses and user experience.

- **Durability**: Ensures data is not lost after a write operation.

- **When to Prioritize Latency**: Low-risk writes where responsiveness is critical.

- **When to Prioritize Durability**: Critical operations like payments and user data changes.

### **Cost vs Performance**

- **Cost**: Encompasses operational expenses, including cloud services and engineering costs.

- **Performance**: Relates to system responsiveness and throughput.

- **Balancing Act**: Finding a middle ground between cost and performance is essential for sustainable system design.

## **Monolith vs Microservices**

### **Monoliths**

- **Definition**: A single, unified application where all components are interconnected.

- **Advantages**: Simplicity in development, easier debugging, and less overhead.

### **Microservices**

- **Definition**: Breaking down applications into smaller, independent services.

- **Advantages**: Scalability and independent deployment.

- **Challenges**: Increased complexity, network communication issues, and management overhead.

## **Read vs Write Optimization**

### **Read-Optimized Systems**

- **Focus**: Prioritize fast and efficient data retrieval.

- **Design Strategies**: Denormalization, aggressive caching, and minimizing database joins.

### **Write-Optimized Systems**

- **Focus**: Fast and reliable data ingestion.

- **Design Strategies**: Bulk writes and append-only operations.

### **CQRS (Command Query Responsibility Segregation)**

- **Definition**: Separates read and write operations to optimize each path independently.

- **Use Case**: Ideal for systems with distinct requirements for reads and writes.

## **Real-Time vs Eventually Consistent**

### **Real-Time Systems**

- **Definition**: Ensure data is always fresh and reflects the latest write.

- **Challenges**: Increased latency and complexity in scaling.

### **Eventually Consistent Systems**

- **Definition**: Accept temporary discrepancies in data across different parts of the system.

- **Use Cases**: Suitable for non-critical data updates where immediate consistency is not required.

## **Designing Step by Step (Interviews)**

1. **Clarify the Prompt**: Restate the design question to ensure understanding.

2. **Gather Functional Requirements**: Identify essential features and components.

3. **Gather Non-Functional Requirements**: Determine performance-related expectations.

4. **Make Estimates**: Calculate user load and system requirements.

5. **Define API Contracts**: Specify how components will interact.

6. **Design High-Level Architecture**: Create an overview of the system's structure.

7. **Deep Dive into a Component**: Focus on one critical area, such as database design.

8. **Plan for Scale and Failure**: Consider strategies for handling increased load and system failures.

9. **Wrap Up with Summary**: Recap key design decisions and future considerations.

## **Conclusion**

- **Summary of Importance**: Understanding system design principles is critical for building scalable and resilient applications.

- **Key Takeaways**: Mastering requirements gathering, trade-offs, and architectural strategies is essential for both interviews and real-world applications.
