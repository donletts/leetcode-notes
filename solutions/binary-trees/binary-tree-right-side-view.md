# [One Week Study Guide](../../readme.md)

## 199. Binary Tree Right Side View

Solved
Medium

Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

### Example 1

**Input**: root = [1,2,3,null,5,null,4]

**Output**: [1,3,4]

**Explanation**:

![BFS from right](images/bfs-from-right-1.jpg)

### Example 2

**Input**: root = [1,2,3,4,null,null,null,5]

**Output**: [1,3,4,5]

**Explanation**:

![BFS from right](images/bfs-from-right-2.jpg)

### Example 3

**Input**: root = [1,null,3]

**Output**: [1,3]

### Example 4

Input: root = []

**Output**: []

**Constraints**:

The number of nodes in the tree is in the range [0, 100].
-100 <= Node.val <= 100

### Solution

```Python
import collections.deque

class Solution:
    def rightSideView(self, root: Optional[TreeNode]) -> List[int]:
        if not root:
            return []

        ans = []
        queue = deque([root])

        while queue:
            current_length = len(queue)
            ans.append(queue[-1].val) # this is the rightmost node for the current level

            for _ in range(current_length):
                node = queue.popleft()
                if node.left:
                    queue.append(node.left)
                if node.right:
                    queue.append(node.right)

        return ans
```
