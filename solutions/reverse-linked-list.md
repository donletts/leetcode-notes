# [One Week Study Guide](../../readme.md)

## 206. Reverse Linked List

Attempted
Easy

Given the head of a singly linked list, reverse the list, and return the reversed list.

### Example 1

![ex1](images/rev1ex1.jpg)  
**Input**: head = [1,2,3,4,5]  
**Output**: [5,4,3,2,1]

### Example 2

![ex2](images/rev1ex2.jpg)  
**Input**: head = [1,2]  
**Output**: [2,1]

### Example 3

**Input**: head = []  
**Output**: []

**Constraints**:

- The number of nodes in the list is the range [0, 5000].
- -5000 <= Node.val <= 5000

**Follow up**: A linked list can be reversed either iteratively or recursively. Could you implement both?

### First Attempt (wrong, time limit exceeded)

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        def findTail(prev, node):
            if not node:
                return prev

            tail = findTail(node, node.next)
            node.next = prev
            return tail

        if not head:
            return []

        return findTail(head, head.next)
```

### Solution (Recursion From Solution)

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    # recursive
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        if not head or not head.next:
            return head

        tail = self.reverseList(head.next)
        head.next.next = head
        head.next = None
        return tail

```

### Solution (iterative From Solution)

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    # iterative
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        curr = head
        prev = None
        while curr:
            tmp = curr.next
            curr.next = prev
            prev = curr
            curr = tmp
        return prev
```
