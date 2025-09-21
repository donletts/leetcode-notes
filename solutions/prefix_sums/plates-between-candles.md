# [One Week Study Guide](../../readme.md)

## 2055. Plates Between Candles

Medium

There is a long table with a line of plates and candles arranged on top of it. You are given a 0-indexed string s consisting of characters '_' and '|' only, where a '_' represents a plate and a '|' represents a candle.

You are also given a 0-indexed 2D integer array queries where queries[i] = [lefti, righti] denotes the substring s[lefti...righti] (inclusive). For each query, you need to find the number of plates between candles that are in the substring. A plate is considered between candles if there is at least one candle to its left and at least one candle to its right in the substring.

For example, s = "||**||**|_", and a query [3, 8] denotes the substring "_||\*\*|". The number of plates between candles in this substring is 2, as each of the two plates has at least one candle in the substring to its left and right.
Return an integer array answer where answer[i] is the answer to the ith query.

### Example 1

![ex-1](images/ex-1.png)

**Input**: s = "**|**|\*\*\*|", queries = [[2,5],[5,9]]

**Output**: [2,3]

**Explanation**:

- queries[0] has two plates between candles.
- queries[1] has three plates between candles.

### Example 2

![ex-2](images/ex-2.png)

**Input**: s = "**\*|**|**\***|**||**|\*", queries = [[1,17],[4,5],[14,17],[5,11],[15,16]]

**Output**: [9,0,0,0,0]

**Explanation**:

- queries[0] has nine plates between candles.
- The other queries have zero plates between candles.

**Constraints**:

- 3 <= s.length <= 105
- s consists of '\*' and '|' characters.
- 1 <= queries.length <= 105
- queries[i].length == 2
- 0 <= lefti <= righti < s.length

### BFS Solution (from ai)

```Python
from typing import List

def platesBetweenCandles(s: str, queries: List[List[int]]) -> List[int]:
    n = len(s)
    prefix = [0] * (n + 1)  # prefix[0] = 0
    nearest_left = [-1] * n
    nearest_right = [-1] * n

    # Build prefix sum of items
    for i, ch in enumerate(s):
        prefix[i + 1] = prefix[i] + (1 if ch == '*' else 0)

    # Nearest candle to the left
    last_candle = -1
    for i in range(n):
        if s[i] == '|':
            last_candle = i
        nearest_left[i] = last_candle

    # Nearest candle to the right
    last_candle = -1
    for i in range(n - 1, -1, -1):
        if s[i] == '|':
            last_candle = i
        nearest_right[i] = last_candle

    # Answer queries
    res = []
    for start, end in queries:
        left_candle = nearest_right[start]
        right_candle = nearest_left[end]
        if left_candle != -1 and right_candle != -1 and left_candle < right_candle:
            res.append(prefix[right_candle] - prefix[left_candle])
        else:
            res.append(0)
    return res

```
