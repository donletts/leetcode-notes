# [One Week Study Guide](../../readme.md)

## 930. Binary Subarrays With Sum

Solved
Medium

Given a binary array nums and an integer goal, return the number of non-empty subarrays with a sum goal.

A subarray is a contiguous part of the array.

### Example 1

**Input**: nums = [1,0,1,0,1], goal = 2
**Output**: 4
**Explanation**: The 4 subarrays are bolded and underlined below:
[***1,0,1***,0,1]
[***1,0,1,0***,1]
[1,***0,1,0,1***]
[1,0,***1,0,1***]

### Example 2

**Input**: nums = [0,0,0,0,0], goal = 0
**Output**: 15

**Constraints**:

- 1 <= nums.length <= 3 \* 104
- nums[i] is either 0 or 1.
- 0 <= goal <= nums.length

### First Attempt (Wrong)

```Python
class Solution:
    def maxSubArrayLen(self, nums: List[int], k: int) -> int:
        prefix_sums = defaultdict(int)
        max_len = 0
        curr_sum = 0
        prefix_sums[0] = -1

        for i in range(len(nums)):
            curr_sum += nums[i]
            max_len = max(max_len, i - prefix_sums[curr_sum - k])

            if curr_sum not in prefix_sums:
                prefix_sums[curr_sum] = i

        return max_len
```

### Algorithm

Algorithm

1. Initialize three variables:

   - An integer `curr_sum` that keeps track of the prefix sum of nums as 0.
   - An integer `max_len` that will keep track of the longest subarray with sum k as 0.
   - A hash map `prefix_sums` that has keys of prefix sums seen so far and values of the first index that each key was seen.
   - initialize our hash map with a key of 0 corresponding to a value of -1 to handle the case where prefix_sum == k
     - If `curr_sum` == k, that means the sum of the array up to this index is equal to k.
     - max_len = max(max_len, i - prefix_sums[curr_sum - k]) would be prefix_sums[0] == -1, so i - (-1) would equal i + 1 to get the length of the subarray at i

2. Iterate through nums. At each index i, add `nums`[i] to `curr_sum`. Then, make the following checks:

   - If `curr_sum` - k exists in `prefix_sums`, that means there is a subarray with sum k ending at the current i. The length will be i - `prefix_sums`[`curr_sum` - k]. If this length is greater than `max_len`, update `max_len`.
   - If the current `curr_sum` does not yet exist in `prefix_sums`, then set `prefix_sums`[`curr_sum`] = i. Only do this if it does not already exist because we only want the earliest instance of this presum.

3. Return `max_len`.

### Solution (From Solution)

```Python
class Solution:
    def maxSubArrayLen(self, nums: List[int], k: int) -> int:
        prefix_sums = defaultdict(int)
        max_len = 0
        curr_sum = 0

        # we need to consider the case when the prefix sum is equal to k.
        # We can either specifically check when the prefix sum is equal to k
        # cxor we can initialize our hash map with a key of 0 corresponding to a value of -1
        prefix_sums[0] = -1

        for i in range(len(nums)):

            curr_sum += nums[i]

            if curr_sum - k in prefix_sums:
                max_len = max(max_len, i - prefix_sums[curr_sum - k])

            # If we run into a duplicate (which is possible because of negative numbers),
            # we should not update the index in the hash map because we want the longest subarray,
            # so we want to keep the index as far to the left as possible.
            if curr_sum not in prefix_sums:
                prefix_sums[curr_sum] = i

        return max_len
```
