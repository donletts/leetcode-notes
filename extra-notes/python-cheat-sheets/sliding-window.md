# 📝 Python Cheat Sheet

## 📌 Key Properties

- Maintains a contiguous subset of elements in an array or string.
- Can be **fixed-size** or **variable-size**.
- Reduces complexity from O(n²) to O(n) for many subarray/substring problems.

## 🧠 When to Use

- Finding the longest/shortest substring or subarray meeting a condition.
- Calculating sums, averages, or counts over a moving range.
- Problems involving unique elements or frequency constraints in a range.

## 🧠 Tips

- For fixed-size windows, update the sum/count incrementally instead of recomputing.
- For variable-size windows, shrink from the left when constraints are violated.
- Watch for off-by-one errors when calculating window length.

## 🧩 Mental Model

Imagine a frame sliding across the data, expanding or contracting to maintain the problem’s constraints.

## 📊 Data Structure Representation

Two indices `left` and `right` define the current window:  
`[left, right]` moves across the array/string.

## 📦 Basics

```python
# Fixed-size window
def max_sum_subarray(nums, k):
    window_sum = sum(nums[:k])
    max_sum = window_sum
    for i in range(k, len(nums)):
        window_sum += nums[i] - nums[i-k]
        max_sum = max(max_sum, window_sum)
    return max_sum
```

## 🎯 Common Patterns

```python
# Variable-size window: Longest substring without repeating characters
def length_of_longest_substring(s):
    seen = {}
    left = 0
    max_len = 0
    for right, ch in enumerate(s):
        if ch in seen and seen[ch] >= left:
            left = seen[ch] + 1
        seen[ch] = right
        max_len = max(max_len, right - left + 1)
    return max_len
```
