# 📝 Python Cheat Sheet

## 📌 Key Properties

- Maintains elements in increasing or decreasing order.
- Useful for range queries and "next greater/smaller" problems.
- Typically stores indices for array problems.

## 🧠 When to Use

- Finding next greater/smaller element.
- Solving stock span or daily temperatures problems.
- Histogram area calculations.

## 🧠 Tips

- Store indices, not values, when you need to calculate distances.
- Decide on increasing vs decreasing order based on problem requirements.

## 🧩 Mental Model

A stack that only allows elements in a certain order, popping when the order is violated.

## 📊 Data Structure Representation

A list used as a stack: `append()` to push, `pop()` to remove from top.

## 📦 Basics

```python
stack = []
stack.append(5)  # push
top = stack[-1]  # peek
stack.pop()      # pop
```

## 🎯 Common Patterns

```python
# Next Greater Element
def next_greater(nums):
    res = [-1] * len(nums)
    stack = []
    for i, num in enumerate(nums):
        while stack and nums[stack[-1]] < num:
            res[stack.pop()] = num
        stack.append(i)
    return res

# Daily Temperatures
def daily_temperatures(T):
    res = [0] * len(T)
```
