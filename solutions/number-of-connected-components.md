# [One Week Study Guide](../readme.md)

## 323. Number of Connected Components in an Undirected Graph

Solved
Medium

You have a graph of n nodes. You are given an integer n and an array edges where edges[i] = [ai, bi] indicates that there is an edge between ai and bi in the graph.

Return the number of connected components in the graph.

### Example 1

![connected graph](conn1-graph.jpg)

**Input:** n = 5, edges = [[0,1],[1,2],[3,4]]  
**Output:** 2

### Example 2

![connected graph](conn2-graph.jpg)

**Input:** n = 5, edges = [[0,1],[1,2],[2,3],[3,4]]  
**Output:** 1

Constraints:

- 1 <= n <= 2000
- 1 <= edges.length <= 5000
- edges[i].length == 2
- 0 <= ai <= bi < n
- ai != bi
- There are no repeated edges.

### Solution

```Python
class Solution:
    def countComponents(self, n: int, edges: List[List[int]]) -> int:
        graph = defaultdict(list)
        seen = set()
        count = 0

        for i in range(len(edges)):
            graph[edges[i][0]].append(edges[i][1])
            graph[edges[i][1]].append(edges[i][0])

        def dfs(node):
            for neighbor in graph[node]:
                if neighbor not in seen:
                    seen.add(neighbor)
                    dfs(neighbor)

        for node in range(n):
            if node not in seen:
                seen.add(node)
                count += 1
                dfs(node)

        return count
```
