# 📝 Python Cheat Sheet

## 📌 Key Properties

- BFS explores level by level.
- DFS explores depth before breadth.
- Works on adjacency lists, matrices, and grids.

## 🧠 When to Use

- Finding shortest path in unweighted graphs (BFS).
- Exploring all connected components.
- Detecting cycles.
- Flood fill problems.

## 🧠 Tips

- Mark nodes visited before enqueueing/pushing to avoid revisits.
- Use recursion limit handling for deep DFS.
- BFS is best for shortest paths; DFS is good for exhaustive search.

## 🧩 Mental Model

Graph traversal is like exploring a network of rooms connected by doors.

## 📊 Data Structure Representation

Adjacency list: `{node: [neighbors]}`  
Adjacency matrix: 2D list of 0/1.

## 📦 Basics

```python
from collections import deque

# BFS
def bfs(start, graph):
    visited = set([start])
    queue = deque([start])
    while queue:
        node = queue.popleft()
        for nei in graph[node]:
            if nei not in visited:
                visited.add(nei)
                queue.append(nei)

# DFS
def dfs(node, graph, visited):
    if node in visited:
        return
    visited.add(node)
    for nei in graph[node]:
        dfs(nei, graph, visited)
```

## 🎯 Common Patterns

```python
# Grid BFS example
def num_islands(grid):
    from collections import deque
    rows, cols = len(grid), len(grid[0])
    visited = set()
    def bfs(r, c):
        q = deque([(r, c)])
        visited.add((r, c))
        while q:
            x, y = q.popleft()
            for dx, dy in [(1,0),(-1,0),(0,1),(0,-1)]:
                nx, ny = x+dx, y+dy
                if 0 <= nx < rows and 0 <= ny < cols and grid[nx][ny] == "1" and (nx, ny) not in visited:
                    visited.add((nx, ny))
                    q.append((nx, ny))
    count = 0
    for r in range(rows):
        for c in range(cols):
            if grid[r][c] == "1" and (r, c) not in visited:
                bfs(r, c)
                count += 1
    return count
```
