# [One Week Study Guide](../readme.md)

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
