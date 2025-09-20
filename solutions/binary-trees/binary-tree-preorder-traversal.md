# [One Week Study Guide](../../readme.md)

## 144. Binary Tree Preorder Traversal

Solved
Easy

Given the root of a binary tree, return the preorder traversal of its nodes' values.

### Example 1

![ex1](images/screenshot-2024-08-29-202743.jpg)

**Input**: root = [1,null,2,3]

**Output**: [1,2,3]

**Explanation**:

### Example 2

![ex2](images/tree_2.jpg)

**Input**: root = [1,2,3,4,5,null,8,null,null,6,7,9]

**Output**: [1,2,4,5,6,7,3,8,9]

**Explanation**:

### Example 3

**Input**: root = []

**Output**: []

### Example 4

**Input**: root = [1]

**Output**: [1]

**Constraints**:

- The number of nodes in the tree is in the range [0, 100].
- -100 <= Node.val <= 100

**Follow up**: Recursive solution is trivial, could you do it iteratively?

### First Attempt DFS (correct!)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def preorderTraversal(self, root: Optional[TreeNode]) -> List[int]:
        if not root:
            return []
        ans = [root.val]
        if root.left:
            ans.extend(self.preorderTraversal(root.left))
        if root.right:
            ans.extend(self.preorderTraversal(root.right))

        return ans
```

### BFS Solution (From Solution)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def preorderTraversal(self, root: Optional[TreeNode]) -> List[int]:
        if not root:
            return []
        ans = []

        stack = deque([root])
        while stack:
            node = stack.pop()
            ans.append(node.val)
            if node.right:
                stack.append(node.right)
            if node.left:
                stack.append(node.left)
        return ans
```
