# [One Week Study Guide](../readme.md)

## 387. First Unique Character in a String

Easy

Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.

### Example 1

**Input**: s = "leetcode"

**Output**: 0

**Explanation**:

The character 'l' at index 0 is the first character that does not occur at any other index.

### Example 2

**Input**: s = "loveleetcode"

**Output**: 2

### Example 3

**Input**: s = "aabb"

**Output**: -1

**Constraints**:

- 1 <= s.length <= 105
- s consists of only lowercase English letters.

### First Attempt (Wrong)

```Python
class Solution:
    def firstUniqChar(self, s: str) -> int:
        freq = defaultdict(int)
        first_uniq = s[0]
        freq[first_uniq] = 0

        for i in range(1, len(s)):
            if s[i] not in freq:
                if first_uniq == -1:
                    first_uniq = i
                freq[s[i]] = i
            elif s[i] == s[first_uniq]
                # first_uniq = -1
        return first_uniq
```

### Approach 1: Horizontal scanning

#### Approach 1: Linear time solution

The best possible solution here could be of a linear time because to ensure that the character is unique you have to check the whole string anyway.

The idea is to go through the string and save in a hash map the number of times each character appears in the string. That would take O(N) time, where N is the number of characters in the string.

Then we go through the string the second time, this time we use the hash map as a reference to check if a character is unique or not. If the character is unique, one could just return its index. The complexity of the second iteration is O(N) as well.

### Solution (From Solution)

```Python
class Solution:
    def firstUniqChar(self, s: str) -> int:
        '''
        go through the string twice
        '''
        freq = defaultdict(int)

        # the other way to build the hash is with this python specific data structure
        # count = collections.Counter(s)
        for char in s:
            freq[char] += 1

        for i, char in enumerate(s):
            if freq[char] == 1:
                return i
        return -1
```
