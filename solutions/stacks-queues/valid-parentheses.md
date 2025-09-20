# [One Week Study Guide](../../readme.md)

## 20. Valid Parentheses

Solved
Easy

Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Every close bracket has a corresponding open bracket of the same type.

### Example 1

**Input**: s = "()"

**Output**: true

### Example 2

**Input**: s = "()[]{}"

**Output**: true

### Example 3

**Input**: s = "(]"

**Output**: false

### Example 4

**Input**: s = "([])"

**Output**: true

### Example 5

**Input**: s = "([)]"

**Output**: false

**Constraints**:

- 1 <= s.length <= 104
- s consists of parentheses only '()[]{}'.

### Approach: Stack

### Algorithm

1. Initialize a stack S.
1. Process each bracket of the expression one at a time.
1. If we encounter an opening bracket, we simply push it onto the stack. This means we will process it later, let us simply move onto the sub-expression ahead.
1. If we encounter a closing bracket, then we check the element on top of the stack. If the element at the top of the stack is an opening bracket of the same type, then we pop it off the stack and continue processing. Else, this implies an invalid expression.
1. In the end, if we are left with a stack still having elements, then this implies an invalid expression.

### First try (correct)

```Python
class Solution:
    def isValid(self, s: str) -> bool:
        '''
        top of stack is always an open
        char could either be open or close
        if char is open, just add it to the stack
        if char is a close, check to see if it's the right close
        if not, return false
        end return not stack. stack should be empty, if not we left something on the table
        '''
        stack = []
        dic = {'(':')', '{':'}', '[':']'}

        for char in s:
            # char is an open
            if char in dic:
                stack.append(char)
            # char is a close, check to see it is the right close
            elif stack and dic[stack[-1]] == char:
                stack.pop()
            # it is not the right close, return false
            else:
                return False
        return not stack
```

### Solution (From Solution)

```Python
class Solution(object):
    def isValid(self, s: str) -> bool:

        # The stack to keep track of opening brackets.
        stack = []

        # Hash map for keeping track of mappings. This keeps the code very clean.
        # Also makes adding more types of parenthesis easier
        mapping = {")": "(", "}": "{", "]": "["}

        # For every bracket in the expression.
        for char in s:

            # If the character is an closing bracket
            if char in mapping:

                # Pop the topmost element from the stack, if it is non empty
                # Otherwise assign a dummy value of '#' to the top_element variable
                top_element = stack.pop() if stack else "#"

                # The mapping for the opening bracket in our hash and the top
                # element of the stack don't match, return False
                if mapping[char] != top_element:
                    return False
            else:
                # We have an opening bracket, simply push it onto the stack.
                stack.append(char)

        # In the end, if the stack is empty, then we have a valid expression.
        # The stack won't be empty for cases like ((()
        return not stack
```
