# [One Week Study Guide](../one-week-intervew-study-guide.md)

## 3. Longest Substring Without Repeating Characters

```txt
Solved
Medium
Given a string s, find the length of the longest substring without duplicate characters.



Example 1:

Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
Example 2:

Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
Example 3:

Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.


Constraints:

0 <= s.length <= 5 * 104
s consists of English letters, digits, symbols and spaces.
```

### Solution

```Python
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        left = right = 0
        result = 0

        counts = defaultdict(int)

        # outer loop eats from the front
        while right < len(s):
            r = s[right]
            counts[r] += 1

            # inner loop eats from the back
            while left < right and counts[r] > 1:
                l = s[left]
                counts[l] -= 1
                left += 1

            result = max(result, right - left + 1)
            right += 1
        return result
```
