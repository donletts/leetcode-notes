# [One Week Study Guide](../../readme.md)

## 101. Symmetric Tree

Easy

Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

## Example 1

![ex1](images/symtree1.jpg)
**Input**: root = [1,2,2,3,4,4,3]
**Output**: true

## Example 2

![ex2](images/symtree2.jpg)
**Input**: root = [1,2,2,null,3,null,3]
**Output**: false

**Constraints**:

- The number of nodes in the tree is in the range [1, 1000].
- -100 <= Node.val <= 100

**Follow up**: Could you solve it both recursively and iteratively?

### First Attempt DBFS (looked at solution)

```Python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSymmetric(self, root: Optional[TreeNode]) -> bool:

        def isMirror(t1, t2):
            if not t1 and t2:
                return False
            if t1 and not t2:
                return False
            if not t1 and not t1:
                return True

            return t1.val == t2.val and isMirror(t1.left, t2.right) and isMirror(t1.right, t2.left)

        return isMirror(root, root)
```

### BFS Solution ()

```Python

```
