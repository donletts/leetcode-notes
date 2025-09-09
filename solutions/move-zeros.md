# [One Week Study Guide](../readme.md)

## 283. Move Zeroes

```txt
Solved Easy
Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Note that you must do this in-place without making a copy of the array.



Example 1:

Input: nums = [0,1,0,3,12]
Output: [1,3,12,0,0]
Example 2:

Input: nums = [0]
Output: [0]


Constraints:

1 <= nums.length <= 104
-231 <= nums[i] <= 231 - 1


Follow up: Could you minimize the total number of operations done?
```

### Solution

```Python
class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """

        '''
        increment i and j until we find a zero
        leave i behind and swap with j when j finds a non zero
        '''
        def swap(nums, i, j):
            tmp = nums[i]
            nums[i] = nums[j]
            nums[j] = tmp


        i = j = 0
        while j < len(nums):
            if nums[j] != 0:
                if i != j:
                    swap(nums, i, j)
                i += 1
            j += 1
```
