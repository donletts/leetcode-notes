# 📝 Python Cheat Sheet

## 📌 Key Properties

- Stores key-value pairs for O(1) average lookups.
- Keys must be hashable.
- Supports dynamic insertion, deletion, and updates.

## 🧠 When to Use

- Counting frequencies.
- Tracking seen elements.
- Mapping values to indices.
- Prefix sum problems.

## 🧠 Tips

- Use `defaultdict` or `Counter` to simplify counting logic.
- Initialize base cases for prefix sum problems.
- Be mindful of mutable default values.

## 🧩 Mental Model

Think of a hashmap as labeled buckets where each key points directly to its value.

## 📊 Data Structure Representation

Internally implemented as a hash table with buckets for key-value pairs.

## 📦 Basics

```python
from collections import defaultdict, Counter

# Frequency count
freq = Counter(nums)

# Defaultdict example
d = defaultdict(int)
d['a'] += 1
```

## 🎯 Common Patterns

```python
# First unique character
def first_unique_char(s):
    from collections import Counter
    count = Counter(s)
    for i, ch in enumerate(s):
        if count[ch] == 1:
            return i
    return -1

# Prefix sum with hashmap
def subarray_sum(nums, k):
    from collections import defaultdict
    count = 0
    curr_sum = 0
    prefix_counts = defaultdict(int)
    prefix_counts[0] = 1
    for num in nums:
        curr_sum += num
        count += prefix_counts[curr_sum - k]
        prefix_counts[curr_sum] += 1
    return count
```
