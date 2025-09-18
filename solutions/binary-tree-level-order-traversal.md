# [One Week Study Guide](../readme.md)

## 102. Binary Tree Level Order Traversal

Solved
Medium

Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

### Example 1

**Input**: root = [3,9,20,null,null,15,7]  
**Output**: [[3],[9,20],[15,7]]

### Example 2

**Input**: root = [1]  
**Output**: [[1]]

### Example 3

**Input**: root = []  
**Output**: []

**Constraints**:

- The number of nodes in the tree is in the range [0, 2000].
- -1000 <= Node.val <= 1000

### First Attempt BFS (correct!)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        if not root:
            return []

        stack = deque([root])
        ans = []

        while stack:
            n = len(stack)
            level = []
            for _ in range(n):
                node = stack.popleft()
                level.append(node.val)
                if node.left:
                    stack.append(node.left)
                if node.right:
                    stack.append(node.right)
            ans.append(level)
        return ans
```

### DFS Solution (From Solution)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        if not root:
            return []

        ans = []

        def collectLevels(level, node):
            if len(ans) < level + 1:
                ans.append([])
            ans[level].append(node.val)
            if node.left:
                collectLevels(level + 1, node.left)
            if node.right:
                collectLevels(level + 1, node.right)

        collectLevels(0, root)
        return ans
```
