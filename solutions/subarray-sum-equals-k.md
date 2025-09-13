# [One Week Study Guide](../../readme.md)

## 560. Subarray Sum Equals K

Attempted
Medium

Given an array of integers nums and an integer k, return the total number of subarrays whose sum equals to k.

A subarray is a contiguous non-empty sequence of elements within an array.

**Example 1:**

> **Input:** nums = [1,1,1], k = 2  
> **Output:** 2

**Example 2:**

> **Input:** nums = [1,2,3], k = 3  
> **Output:** 2

Constraints:

- `1 <= nums.length <= 2 * 104`
- `-1000 <= nums[i] <= 1000`
- `-107 <= k <= 107`

### First Attempt

```Python
class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        '''
        Intuition: use a sliding window to count how many subarrays are equal to k
        outer loop eats right and inner loop eats left
        '''

        result = 0
        left = right = 0
        curr_sum = 0

        while right < len(nums):
            r = nums[right]
            curr_sum += r
            while left < right and curr_sum != k:
                l = nums[left]
                curr_sum -= l
                left += 1
            if curr_sum == k:
                result += 1
            right += 1
        return result
```

Your intuition about using a sliding window is solid — but the reason this solution fails for nums = [1, -1, 0] and k = 0 is because sliding window only works when all numbers are non-negative. Here's why:

#### ❌ Why This Sliding Window Fails

Your intuition about using a sliding window is solid — but the reason this solution fails for nums = [1, -1, 0] and k = 0 is because sliding window only works when all numbers are **non-negative**.

Sliding window assumes that:

- Expanding the window (moving right) increases the sum.
- Shrinking the window (moving left) decreases the sum.
- Once the sum exceeds or falls short of k, you can adjust the window accordingly.

But with negative numbers, this logic breaks:

- Adding a negative number can decrease the sum unexpectedly.
- Removing a number might increase the sum.
- You can’t guarantee that shrinking or expanding will move you closer to k.

### Trace table 1

Example: nums = [1, 2, 1, 2, 1], k = 3  
We want to count how many contiguous subarrays sum to k = 3.

📊 Step-by-Step Trace Table

| Index | Num | curr_sum | curr_sum - k | prefix_sum[curr_sum - k] | Count Added | Total Count | Updated prefix_sum                   |
| :---- | :-- | :------- | :----------- | :----------------------- | :---------- | :---------- | :----------------------------------- |
| 0     | 1   | 1        | -2           | 0                        | 0           | 0           | {0: 1, 1: 1}                         |
| 1     | 2   | 3        | 0            | 1                        | 1           | 1           | {0: 1, 1: 1, 3: 1}                   |
| 2     | 1   | 4        | 1            | 1                        | 1           | 2           | {0: 1, 1: 1, 3: 1, 4: 1}             |
| 3     | 2   | 6        | 3            | 1                        | 1           | 3           | {0: 1, 1: 1, 3: 1, 4: 1, 6: 1}       |
| 4     | 1   | 7        | 4            | 1                        | 1           | 4           | {0: 1, 1: 1, 3: 1, 4: 1, 6: 1, 7: 1} |

✅ Final Result

> return count # → 4

### Explaination

prefix_sum[curr_sum - k] > 1 means there are multiple previous subarrays that ended at different indices but all had the same cumulative sum difference from the current point. Each one marks a valid starting point for a new subarray that sums to k.

#### 💥 High-frequency case: nums = [0, 0, 0, 0], k = 0

This is where prefix_sum[curr_sum - k] becomes greater than 1:

| Index | Num | curr_sum | curr_sum - k | prefix_sum[curr_sum - k] | Count | Added prefix_sum |
| :---- | :-- | :------- | :----------- | :----------------------- | :---- | :--------------- |
| 0     | 0   | 0        | 0            | 1                        | 1     | {0:2}            |
| 1     | 0   | 0        | 0            | 2                        | 2     | {0:3}            |
| 2     | 0   | 0        | 0            | 3                        | 3     | {0:4}            |
| 3     | 0   | 0        | 0            | 4                        | 4     | {0:5}            |

#### ✅ Final count: 1 + 2 + 3 + 4 = 10 subarrays

Each zero adds to the total count based on how many times we've seen curr_sum = 0 before. That’s why prefix_sum[curr_sum - k] can be greater than 1 — and why this pattern is so powerful for counting subarrays.

### Solution (From copilot ai)

```Python
from collections import defaultdict

class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        count = 0
        curr_sum = 0
        prefix_sums = defaultdict(int) # initializes everything to zero, no out of bounds
        prefix_sums[0] = 1  # base case

        for num in nums:
            curr_sum += num
            count += prefix_sums[curr_sum - k]
            prefix_sums[curr_sum] += 1

        return count
```
