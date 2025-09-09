# [One Week Study Guide](../readme.md)

## 200. Number of Islands

Solved
Medium

Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

### Example 1

**Input**: grid = [
["1","1","1","1","0"],
["1","1","0","1","0"],
["1","1","0","0","0"],
["0","0","0","0","0"]
]
**Output**: 1

### Example 2

**Input**: grid = [
["1","1","0","0","0"],
["1","1","0","0","0"],
["0","0","1","0","0"],
["0","0","0","1","1"]
]
**Output**: 3

**Constraints**:

- m == grid.length
- n == grid[i].length
- 1 <= m, n <= 300
- grid[i][j] is '0' or '1'.

### Solution

```Python
class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        m = len(grid)
        n = len(grid[0])
        directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        seen = set()
        islands = 0

        def valid(row, col):
            return 0 <= row < m and 0 <= col < n and grid[row][col] == "1"

        def dfs(row, col):
            for dx, dy in directions:
                new_row, new_col = row + dx, col + dy
                if valid(new_row, new_col) and (new_row, new_col) not in seen:
                    seen.add((new_row, new_col))
                    dfs(new_row, new_col)

        for row in range(m):
            for col in range(n):
                if (row, col) not in seen and grid[row][col] == "1":
                    islands += 1
                    seen.add((row, col))
                    dfs(row, col)

        return islands
```
