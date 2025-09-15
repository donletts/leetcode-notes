# [One Week Study Guide](../../readme.md)

## 141. Linked List Cycle

Solved
Easy

Given head, the head of a linked list, determine if the linked list has a cycle in it.

There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.

Return true if there is a cycle in the linked list. Otherwise, return false.

### Example 1

**Input**: head = [3,2,0,-4], pos = 1
**Output**: true
**Explanation**: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).

### Example 2

**Input**: head = [1,2], pos = 0
**Output**: true
**Explanation**: There is a cycle in the linked list, where the tail connects to the 0th node.

### Example 3

**Input**: head = [1], pos = -1
**Output**: false
**Explanation**: There is no cycle in the linked list.

**Constraints**:

- The number of the nodes in the list is in the range [0, 104].
- -105 <= Node.val <= 105
- pos is -1 or a valid index in the linked-list.

**Follow up:** Can you solve it using O(1) (i.e. constant) memory?

### First Attempt (correct! but not optimal. uses O(n) extra memory for set)

```Python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution:
    def hasCycle(self, head: Optional[ListNode]) -> bool:
        '''
        maybe keep a seen set to see if the value has already been visited
        just loop until either pos == -1
        or
        maybe just keep ... no i think you need a set of either the values or the actual node
        '''
        if not head:
            return False

        seen = set()
        node = head
        while node:
            if node in seen:
                return True
            seen.add(node)
            node = node.next
        return False
```

### Approach 2: Floyd's Cycle Finding Algorithm (slow pointer/fast pointer)

#### Intuition

Imagine two runners running on a track at different speed. What happens when the track is actually a circle?

#### Algorithm

The space complexity can be reduced to O(1) by considering two pointers at different speed - a slow pointer and a fast pointer. The slow pointer moves one step at a time while the fast pointer moves two steps at a time.

If there is no cycle in the list, the fast pointer will eventually reach the end and we can return false in this case.

Now consider a cyclic list and imagine the slow and fast pointers are two runners racing around a circle track. The fast runner will eventually meet the slow runner. Why? Consider this case (we name it case A) - The fast runner is just one step behind the slow runner. In the next iteration, they both increment one and two steps respectively and meet each other.

How about other cases? For example, we have not considered cases where the fast runner is two or three steps behind the slow runner yet. This is simple, because in the next or next's next iteration, this case will be reduced to case A mentioned above.

### Solution (From Solution)

```Python
class Solution:
    def hasCycle(self, head: ListNode) -> bool:
        if head is None:
            return False
        slow = head
        fast = head.next
        while slow != fast:
            if fast is None or fast.next is None:
                return False
            slow = slow.next
            fast = fast.next.next
        return True
```
