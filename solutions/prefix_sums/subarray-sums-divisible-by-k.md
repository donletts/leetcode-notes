# [One Week Study Guide](../../readme.md)

## 974. Subarray Sums Divisible by K

Medium

Given an integer array nums and an integer k, return the number of non-empty subarrays that have a sum divisible by k.

A subarray is a contiguous part of an array.

### Example 1

**Input**: nums = [4,5,0,-2,-3,1], k = 5
**Output**: 7
**Explanation**: There are 7 subarrays with a sum divisible by k = 5:
[4, 5, 0, -2, -3, 1], [5], [5, 0], [5, 0, -2, -3], [0], [0, -2, -3], [-2, -3]

### Example 2

**Input**: nums = [5], k = 9
**Output**: 0

**Constraints**:

- 1 <= nums.length <= 3 \* 104
- -104 <= nums[i] <= 104
- 2 <= k <= 104

### Algorithm

1. Initialize an integer prefixMod = 0 to store the remainder when the sum of the elements of a array till the current index when divided by k, and the answer variable result = 0 to store the number of subarrays divisible by k.
1. Initialize an array, modGroups[k] where modGroup[R] stores the number of subarrays encountered with the sum of elements having a remainder R when divided by k. Set modGroups[0] = 1.
1. Iterate over all the elements of num.
1. For each index i, compute the prefix modulo as prefixMod = (prefixMod + num[i] % k + k) % k. We take modulo twice in (prefixMod + num[i] % k + k) % k to remove negative numbers since num[i] can be a negative number and the sum prefixMod + nums[i] % k can turn out to be negative. To remove the negative number we add k to make it positive and then takes its modulo again with k.
   1. In Python, the modulo operator % always returns a non-negative remainder, even when the dividend is negative.
   1. In languages like Java or C++, % can return a negative remainder if the numerator is negative.
      1. Step 1: num[i] % k
         1. This gives the remainder of num[i] divided by k
         1. But if num[i] is negative, this might be negative too
      1. Step 2: + k
         1. Adding k ensures the result is non-negative
         1. It shifts any negative remainder into the positive range
      1. Step 3: % k again
         1. This wraps the result back into the correct modulo range [0, k-1]
1. Add the number of subarrays encountered till now that have the same remainder to the result: result = result + modGroups[prefixMod].
1. In the end, we include the remainder of the subarray in the modGroups, i.e., modGroups[prefixMod] = modGroups[prefixMod] + 1 for future matches.
   Return result.

### Trace Table

nums = [4, 5, 0, -2, -3, 1] with k = 5

| Index | Num | prefixMod = (prefixMod + num) % 5 | modGroups[prefixMod] | Count Added | Total Count | Updated modGroups  |
| ----- | --- | --------------------------------- | -------------------- | ----------- | ----------- | ------------------ |
| 0     | 4   | 4                                 | 0                    | 0           | 0           | {0: 1, 4: 1}       |
| 1     | 5   | 4                                 | 1                    | 1           | 1           | {0: 1, 4: 2}       |
| 2     | 0   | 4                                 | 2                    | 2           | 3           | {0: 1, 4: 3}       |
| 3     | -2  | 2                                 | 0                    | 0           | 3           | {0: 1, 4: 3, 2: 1} |
| 4     | -3  | 4                                 | 3                    | 3           | 6           | {0: 1, 4: 4, 2: 1} |
| 5     | 1   | 0                                 | 1                    | 1           | 7           | {0: 2, 4: 4, 2: 1} |

**Final Result:**
return count # → 7

### Solution (From copilot ai)

```Python
class Solution:
    def subarraysDivByK(self, nums: List[int], k: int) -> int:
        modGroups = defaultdict(int)
        modGroups[0] = 1
        result = 0
        prefixMod = 0
        for num in nums:
            # NOTE: only needed in languages where -num % k returns a negative number (ie not Python)
            # prefixMod = ( prefixMod + num % k + k ) % k
            prefixMod = ( prefixMod + num ) % k
            result += modGroups[prefixMod]
            modGroups[prefixMod] += 1
        return result
```
