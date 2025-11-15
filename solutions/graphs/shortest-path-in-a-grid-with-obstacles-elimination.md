# [One Week Study Guide](../../readme.md)

## 1293. Shortest Path in a Grid with Obstacles Elimination

Solved
Hard

You are given an m x n integer matrix grid where each cell is either 0 (empty) or 1 (obstacle). You can move up, down, left, or right from and to an empty cell in one step.

Return the minimum number of steps to walk from the upper left corner (0, 0) to the lower right corner (m - 1, n - 1) given that you can eliminate at most k obstacles. If it is not possible to find such walk return -1.

### Example 1

![example 1](images/short1-grid.jpg)

**Input**: grid = [[0,0,0],[1,1,0],[0,0,0],[0,1,1],[0,0,0]], k = 1

**Output**: 6

**Explanation**:

The shortest path without eliminating any obstacle is 10.
The shortest path with one obstacle elimination at position (3,2) is 6. Such path is (0,0) -> (0,1) -> (0,2) -> (1,2) -> (2,2) -> (3,2) -> (4,2).

### Example 2

![example 2](images/short2-grid.jpg)

**Input**: grid = [[0,1,1],[1,1,1],[1,0,0]], k = 1

**Output**: -1

**Explanation**: We need to eliminate at least two obstacles to find such a walk.

**Constraints**:

- m == grid.length
- n == grid[i].length
- 1 <= m, n <= 40
- 1 <= k <= m \* n
- grid\[i][j] is either 0 or 1.
- grid\[0][0] == grid\[m - 1][n - 1] == 0

## Solution

```python
class Solution:
    def shortestPath(self, grid: List[List[int]], k: int) -> int:

        m = len(grid)
        n = len(grid[0])

        def valid(row, col):
            return 0 <= row < m and 0 <= col < n

        directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]

        queue = deque([(0, 0, k, 0)])
        seen = set([(0, 0, k)])

        while queue:
            row, col, remain, steps = queue.popleft()
            if row == m - 1 and col == n - 1:
                return steps
            for dx, dy in directions:
                next_row, next_col = row + dx, col + dy
                if valid(next_row, next_col):
                    if grid[next_row][next_col] == 0:
                        if (next_row, next_col, remain) not in seen:
                            seen.add((next_row, next_col, remain))
                            queue.append((next_row, next_col, remain, steps + 1))
                    elif remain and (next_row, next_col, remain - 1) not in seen:
                        seen.add((next_row, next_col, remain - 1))
                        queue.append((next_row, next_col, remain - 1, steps + 1))
        return -1
```
