# 📝 Python Cheat Sheet

## 📌 Key Properties

- Uses two indices to traverse data.
- Pointers can move in the same direction or towards each other.
- Often reduces complexity from O(n²) to O(n).

## 🧠 When to Use

- Searching in sorted arrays.
- Detecting cycles in linked lists.
- Partitioning arrays or strings.
- Merging sorted lists.

## 🧠 Tips

- Ensure pointers converge to avoid infinite loops.
- Choose movement strategy based on the condition being checked.
- For sorted data, moving pointers inward can efficiently find target sums.

## 🧩 Mental Model

Two markers scanning the data from different positions to meet a condition.

## 📊 Data Structure Representation

Two indices `l` and `r` moving towards each other or in tandem.

## 📦 Basics

```python
# Opposite ends
def two_sum_sorted(nums, target):
    l = 0, r = len(nums) - 1
    while l < r:
        s = nums[l] + nums[r]
        if s == target:
            return [l, r]
        elif s < target:
            l += 1
        else:
            r -= 1
```

## 🎯 Common Patterns

```python
# Same direction: Remove duplicates from sorted array
def remove_duplicates(nums):
    if not nums:
        return 0
    slow = 0
    for fast in range(1, len(nums)):
        if nums[fast] != nums[slow]:
            slow += 1
            nums[slow] = nums[fast]
    return slow + 1
```
