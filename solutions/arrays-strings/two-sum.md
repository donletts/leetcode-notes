# [One Week Study Guide](../../readme.md)

## 1. Two Sum

Solved
Easy

Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

### Example 1

**Input**: nums = [2,7,11,15], target = 9  
**Output**: [0,1]  
**Explanation**: Because nums[0] + nums[1] == 9, we return [0, 1].

### Example 2

**Input**: nums = [3,2,4], target = 6  
**Output**: [1,2]

### Example 3

**Input**: nums = [3,3], target = 6  
**Output**: [0,1]

**Constraints**:

- 2 <= nums.length <= 104
- -109 <= nums[i] <= 109
- -109 <= target <= 109
- **Only one valid answer exists.**

### First Attempt (Wrong)

```Python
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        # prefix sums
        '''
        dict of sum to index
        count += dict[curr_sum - target]
        '''
        prefix_sum = defaultdict(int)

        curr_sum = 0

        for i, n in enumerate(nums):
            curr_sum += n
            if curr_sum - target in prefix_sum:
                return [prefix_sum[curr_sum - target], i]
            prefix_sum[curr_sum] = i
        return []
```

### 🔍 Problem Recap: Two Sum

Given an array nums and a target target, return indices of two distinct elements whose values sum to target.

This is a value-based problem — not a subarray sum problem. So prefix sums (which accumulate over contiguous elements) aren’t the most natural fit here.

### 🧠 Why Prefix Sum Doesn’t Quite Fit

Your code is solving a different problem:

“Find a subarray (contiguous) whose sum equals target.”

That’s more like Subarray Sum Equals K — where prefix sums shine.

In contrast, Two Sum wants:

Any two elements (not necessarily adjacent)

Whose individual values sum to target

### Solution (From AI/Solution)

```Python
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        # prefix sums
        '''
        dict of sum to index
        count += dict[curr_sum - target]
        '''
        seen = defaultdict(int)

        for i, n in enumerate(nums):
            compliment = target - n
            if compliment in seen:
                return [seen[compliment], i]
            seen[n] = i
        return []
```
