# [One Week Study Guide](../../readme.md)

## 1248. Count Number of Nice Subarrays

Medium

Given an array of integers nums and an integer k. A continuous subarray is called nice if there are k odd numbers on it.

Return the number of nice sub-arrays.

### Example 1

**Input**: nums = [1,1,2,1,1], k = 3  
**Output**: 2  
**Explanation**: The only sub-arrays with 3 odd numbers are [1,1,2,1] and [1,2,1,1].

### Example 2

**Input**: nums = [2,4,6], k = 1  
**Output**: 0  
**Explanation**: There are no odd numbers in the array.

### Example 3

**Input**: nums = [2,2,2,1,2,2,1,2,2,2], k = 2  
**Output**: 16

**Constraints**:

- 1 <= nums.length <= 50000
- 1 <= nums[i] <= 10^5
- 1 <= k <= nums.length

### First Attempt (Wrong)

```Python
class Solution:
    def numberOfSubarrays(self, nums: List[int], k: int) -> int:
        prefix_odds = defaultdict(int)
        num_odds = 0
        count = 0
        prefix_odds[0] = 1

        for num in nums:
            # check for odd
            if num % 2:
                num_odds += 1
                count += prefix_odds[num_odds - k]
                prefix_odds[num_odds] += 1

        return count
```

### Algorithm

1. Initialize integers num_odds = 0,count = 0 and a hashmap prefix_odds.
1. Initialize prefix_odds[0] with 1 to account for the initial value of num_odds.
1. Iterate over all the elements of nums:
   - Compute num_odds as num_odds = num_odds + nums[i] % 2.
   - If num_odds - k exists in the hashmap:
     - optional because we initialized prefix_odds to zero with defaultdict
     - however this is an optimazation and uses less memory
     - if num_odds - k doesn't exist then prefix_odds[num_odds - k] will return 0 and increment count by 0
   - Increment the value of count with prefix_odds[num_odds - k].
   - Increment prefix_odds[num_odds] by 1.
1. Return count.

### Solution (From Solution)

```Python
class Solution:
    def numberOfSubarrays(self, nums: List[int], k: int) -> int:
        prefix_odds = defaultdict(int)
        num_odds = 0
        count = 0
        prefix_odds[0] = 1

        for num in nums:
            # check for odd
            num_odds += num % 2
            # this line is optional because we initialized prefix_odds to zero with defaultdict
            # however this is an optimazation and uses less memory
            if num_odds - k in prefix_odds:
                count += prefix_odds[num_odds - k]
            prefix_odds[num_odds] += 1

        return count
```
