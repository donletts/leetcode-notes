# 🎯 Prefix Sum Warm-Up Set

## **1. Basic Prefix Sum**

**Problem:**  
Count the number of continuous subarrays whose sum equals `k`.

**Example:**  
Input: nums = [1, 2, 3], k = 3  
Output: 2  
**Pattern:** Running sum + hashmap of counts.

---

## **2. Prefix Sum + Index**

**Problem:**  
Find the maximum length of a subarray that sums to `k`.

**Example:**  
Input: nums = [1, -1, 5, -2, 3], k = 3  
Output: 4  
**Pattern:** Store earliest index for each prefix sum.

---

## **3. Prefix Sum + Modulo**

**Problem:**  
Count subarrays whose sum is divisible by `k`.

**Example:**  
Input: nums = [4,5,0,-2,-3,1], k = 5  
Output: 7  
**Pattern:** Track `(prefix_sum % k)` counts in hashmap.

---

## **4. Prefix Sum + Binary**

**Problem:**  
Count binary subarrays with sum = goal.

**Example:**  
Input: nums = [1,0,1,0,1], goal = 2  
Output: 4  
**Pattern:** Running sum + hashmap of counts.

---

## **5. Prefix Sum + Odd Count**

**Problem:**  
Count subarrays with exactly `k` odd numbers.

**Example:**  
Input: nums = [1,1,2,1,1], k = 3  
Output: 2  
**Pattern:** Convert to prefix sum of odd counts.
