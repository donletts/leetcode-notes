# [One Week Study Guide](../readme.md)

## 104. Maximum Depth of Binary Tree

Solved
Easy

Given the root of a binary tree, return its maximum depth.

A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

### Example 1

![tmp tree](images/tmp-tree.jpg)  
**Input**: root = [3,9,20,null,null,15,7]  
**Output**: 3

### Example 2

**Input**: root = [1,null,2]  
**Output**: 2

**Constraints**:

- The number of nodes in the tree is in the range [0, 104].
- -100 <= Node.val <= 100

### First Try (DFS Correct)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        if not root:
            return 0
        left = 1 + self.maxDepth(root.left)
        right = 1 + self.maxDepth(root.right)
        return max(left, right)
```

### Second Try (BFS Correct)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        if not root:
            return 0

        stack = deque([root])
        depth = 0

        while stack:
            n = len(stack)
            depth += 1
            for _ in range(n):
                node = stack.popleft()
                if node.left:
                    stack.append(node.left)
                if node.right:
                    stack.append(node.right)
        return depth
```
