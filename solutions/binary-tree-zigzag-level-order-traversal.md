# [One Week Study Guide](../readme.md)

## 103. Binary Tree Zigzag Level Order Traversal

Solved
Medium

Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).

### Example 1

![tree](images/tree1.jpg)

**Input**: root = [3,9,20,null,null,15,7]  
**Output**: [[3],[20,9],[15,7]]

### Example 2

**Input**: root = [1]  
**Output**: [[1]]

### Example 3

**Input**: root = []  
**Output**: []

**Constraints**:

- The number of nodes in the tree is in the range [0, 2000].
- -100 <= Node.val <= 100

### Solution

```Python
class Solution:
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None
from collections import deque


class Solution:
    def zigzagLevelOrder(self, root: TreeNode) -> List[List[int]]:
        if root is None:
            return []

        results = []

        def dfs(node: TreeNode, level: int) -> None:
            if level >= len(results):
                results.append(deque([node.val]))
            else:
                if level % 2 == 0:
                    results[level].append(node.val)
                else:
                    results[level].appendleft(node.val)

            for next_node in [node.left, node.right]:
                if next_node is not None:
                    dfs(next_node, level + 1)

        # normal level order traversal with DFS
        dfs(root, 0)

        return results
```
