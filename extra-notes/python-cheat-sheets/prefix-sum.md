# 📝 Python Prefix Sum Cheat Sheet

## 📌 Key Properties

- **Time complexity**: O(n) to build, O(1) per range sum query
- **Space complexity**: O(n) for prefix array, O(1) if only running sum is needed
- Works for:
  - Range sum queries
  - Counting subarrays with given sum
  - Modulo-based divisibility checks
  - Transformations (e.g., odd counts, binary balance)

## 🧠 When to Use

- When you need fast range sum queries
- When counting subarrays with certain sum properties
- When transforming a problem into a cumulative form makes it easier

## 🧩 Prefix Sum Mental Model

A **prefix sum** is a running total of elements up to each index.
Example:  
`nums = [1, 2, 3, 4]`  
`prefix = [0, 1, 3, 6, 10]`

- `prefix[i]` = sum of first `i` elements
- Sum of subarray `[l, r]` = `prefix[r+1] - prefix[l]`

## 📦 Basics

```python
# Basic prefix sum array
nums = [1, 2, 3, 4]
prefix = [0] * (len(nums) + 1)
for i in range(len(nums)):
    prefix[i+1] = prefix[i] + nums[i]

# Sum of subarray [l, r]
sub_sum = prefix[r+1] - prefix[l]
```

### 🔍 Prefix Sum with Hashmap (Count Subarrays)

```python
from collections import defaultdict

def subarray_sum(nums, k):
    count = 0
    curr_sum = 0
    prefix_counts = defaultdict(int)
    prefix_counts[0] = 1  # base case

    for num in nums:
        curr_sum += num
        count += prefix_counts[curr_sum - k]
        prefix_counts[curr_sum] += 1
    return count
```

### 📏 Prefix Sum + Index (Max Length)

```python
def max_subarray_len(nums, k):
    curr_sum = 0
    first_index = {}
    max_len = 0

    for i, num in enumerate(nums):
        curr_sum += num
        if curr_sum == k:
            max_len = i + 1
        if curr_sum - k in first_index:
            max_len = max(max_len, i - first_index[curr_sum - k])
        if curr_sum not in first_index:
            first_index[curr_sum] = i
    return max_len
```

### ➗ Prefix Sum + Modulo

```python
def subarrays_div_by_k(nums, k):
    count = 0
    curr_mod = 0
    mod_counts = defaultdict(int)
    mod_counts[0] = 1

    for num in nums:
        curr_mod = (curr_mod + num) % k
        count += mod_counts[curr_mod]
        mod_counts[curr_mod] += 1
    return count
```
