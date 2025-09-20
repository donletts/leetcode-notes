# [One Week Study Guide](../../readme.md)

## 21. Merge Two Sorted Lists

Solved
Easy

You are given the heads of two sorted linked lists list1 and list2.

Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

Return the head of the merged linked list.

### Example 1

![ex1](images/merge_ex1.jpg)
**Input**: list1 = [1,2,4], list2 = [1,3,4]
**Output**: [1,1,2,3,4,4]

### Example 2

**Input**: list1 = [], list2 = []
**Output**: []

### Example 3

**Input**: list1 = [], list2 = [0]
**Output**: [0]

**Constraints**:

- The number of nodes in both lists is in the range [0, 50].
- -100 <= Node.val <= 100
- Both list1 and list2 are sorted in non-decreasing order.

### First Attempt (Correct!)

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        '''
        iterate one list until the node is greater then iterate the second list
        '''
        if not list1 and list2:
            return list2
        if not list2 and list1:
            return list1
        if not list1 and not list2:
            return None

        if list1.val <= list2.val:
            ans = list1
            list1 = list1.next
        else:
            ans = list2
            list2 = list2.next

        head = ans

        while list1 and list2:
            if list1.val <= list2.val:
                ans.next = list1
                list1 = list1.next
            elif list2.val < list1.val:
                ans.next = list2
                list2 = list2.next
            ans = ans.next

        if list1:
            ans.next = list1
        if list2:
            ans.next = list2

        return head
```

### Solution (Iterative From Solution)

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        prev_head = ListNode(-1)

        prev = prev_head

        while list1 and list2:
            if list1.val <= list2.val:
                prev.next = list1
                list1 = list1.next
            elif list2.val < list1.val:
                prev.next = list2
                list2 = list2.next
            prev = prev.next
        if list1:
            prev.next = list1
        elif list2:
            prev.next = list2
        return prev_head.next
```

### Solution (Recursive From Solution)

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        if not list1:
            return list2
        if not list2:
            return list1

        if list1.val < list2.val:
            list1.next = self.mergeTwoLists(list1.next, list2)
            return list1
        else:
            list2.next = self.mergeTwoLists(list1, list2.next)
            return list2
```
