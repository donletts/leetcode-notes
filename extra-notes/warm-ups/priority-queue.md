# 🎯 Priority Queue Warm-Up Set

## **1. Min-Heap Basics**

**Problem:**  
Find the **kth largest element** in an unsorted array.

**Example:**  
Input: nums = [3,2,1,5,6,4], k = 2  
Output: 5  
**Pattern:** Min-heap of size k → pop smallest when size exceeds k.

---

## **2. Max-Heap via Negation**

**Problem:**  
Find the **k closest points** to the origin `(0,0)`.

**Example:**  
Input: points = [[1,3],[-2,2]], k = 1  
Output: [[-2,2]]  
**Pattern:** Push `(-distance, point)` into heap to simulate max-heap.

---

## **3. Scheduling with Min-Heap**

**Problem:**  
Given meeting intervals, return the **minimum number of meeting rooms** required.

**Example:**  
Input: [[0,30],[5,10],[15,20]]  
Output: 2  
**Pattern:** Sort by start time, push end times into min-heap, pop when a meeting ends.

---

## **4. Heap for Top-K Frequency**

**Problem:**  
Return the **k most frequent elements** in an array.

**Example:**  
Input: nums = [1,1,1,2,2,3], k = 2  
Output: [1,2]  
**Pattern:** Count with hashmap, push `(freq, num)` into min-heap of size k.

---

## **5. Heap in Graph Algorithms**

**Problem:**  
Find the time it takes for all nodes to receive a signal from a starting node.

**Example:**  
Input: times = [[2,1,1],[2,3,1],[3,4,1]], n = 4, k = 2  
Output: 2  
**Pattern:** Dijkstra’s algorithm with min-heap keyed by distance.
