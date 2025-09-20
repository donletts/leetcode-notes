# 📝 Python Heap Cheat Sheet

Here’s a one-page Python Heap Cheat Sheet in Markdown that you can drop straight into your study guide. It covers min-heaps, max-heaps, two-heaps median, and common patterns — all in a compact, reference-friendly format.

## 📌 Key Properties

- Shape: Always a complete binary tree (filled left to right)
- Order: Parent is always ≤ (min-heap) or ≥ (max-heap) its children
- Access: `heap[0]` is always the smallest (min-heap) or largest (max-heap via negation)
- Efficiency:
  - Insert: O(log n)
  - Pop: O(log n)
  - Peek: O(1)
  - Heapify: O(n)

## 🧠 When to Use

- Heaps are great for:
  - **Top-K problems** (keep heap size ≤ k)
  - **Streaming medians** (two heaps)
  - **Scheduling / interval problems**
  - **Graph shortest paths (Dijkstra)**

## 🧠 Tips

- Use `heapq.nlargest(k, iterable)` / `heapq.nsmallest(k, iterable)` for quick selection.
- Remember: `heapq` works on lists in-place.

## 🧩 Heap Mental Model

A `heap` is a complete binary tree stored in an array, where:

- **Min-heap**: every parent ≤ its children
- **Max-heap**: every parent ≥ its children **_(simulated in Python by negating values)_**

## 📊 Array Representation

Example Min-Heap storing `[1, 3, 4, 5, 9, 6]`:

**Index**: `0 1 2 3 4 5`  
**Value**: `[1, 3, 4, 5, 9, 6]`

Tree view:

```text
        1
       / \
      3   4
     / \  /
    5  9 6
```

- **Parent index**: `(i - 1) // 2`
- **Left child index**: `2 _i + 1`
- **Right child index**: `2_ i + 2`

## 📦 Basics

- Python’s `heapq` implements a **min-heap**.
- Heap property: `heap[0]` is always the smallest element.
- Operations are **O(log n)** for push/pop, **O(1)** for peek.

```python
import heapq

# Create a heap
heap = []
heapq.heappush(heap, 3)
heapq.heappush(heap, 1)
heapq.heappush(heap, 4)

# Peek smallest
smallest = heap[0]  # 1

# Pop smallest
val = heapq.heappop(heap)  # 1

# Heapify existing list
nums = [3, 1, 4]
heapq.heapify(nums)  # in-place O(n)
```

### 🔼 Max-Heap via Negation

Python has no built-in max-heap — simulate by pushing negated values.

```python
max_heap = []
heapq.heappush(max_heap, -3)
heapq.heappush(max_heap, -1)
heapq.heappush(max_heap, -4)

largest = -heapq.heappop(max*heap) # 4
```

## 🎯 Common Patterns

### 1️⃣ Kth Largest Element

```python
def kth_largest(nums, k):
    heap = []
    for num in nums:
        heapq.heappush(heap, num)
        if len(heap) > k:
            heapq.heappop(heap)
    return heap[0]

return heap[0]
```

### 2️⃣ K Closest Points to Origin

```python
import math
def k_closest(points, k):
    heap = []
    for x, y in points:
        dist = -(x*x + y*y)  # negate for max-heap
        heapq.heappush(heap, (dist, (x, y)))
        if len(heap) > k:
            heapq.heappop(heap)
    return [point for _, point in heap]

```

### 3️⃣ Meeting Rooms II (Scheduling)

```python
def min_meeting_rooms(intervals):
    intervals.sort(key=lambda x: x[0])
    heap = []
    for start, end in intervals:
        if heap and heap[0] <= start:
            heapq.heappop(heap)
        heapq.heappush(heap, end)
    return len(heap)
```

### 4️⃣ Top-K Frequent Elements

```python
from collections import Counter
def top_k_frequent(nums, k):
    freq = Counter(nums)
    heap = []
    for num, count in freq.items():
        heapq.heappush(heap, (count, num))
        if len(heap) > k:
            heapq.heappop(heap)
    return [num for _, num in heap]
```

### ⚖️ Two-Heaps Median Pattern

Maintain:

- Max-heap (negated) for lower half
- Min-heap for upper half

```python
low, high = [], []  # max-heap, min-heap

def add_num(num):
    heapq.heappush(low, -num)
    heapq.heappush(high, -heapq.heappop(low))
    if len(high) > len(low):
        heapq.heappush(low, -heapq.heappop(high))

def find_median():
    if len(low) > len(high):
        return -low[0]
    return (-low[0] + high[0]) / 2

```
