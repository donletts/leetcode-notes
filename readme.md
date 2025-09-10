# 🧠 Donald’s Focused Algorithm Tracker (Week-of-OA Edition)

Absolutely — with less than a week and your current progress through the LeetCode Crash Course, the smartest move is to go deep, not wide. You want to master the patterns you've already touched so you can execute confidently under pressure.
Here’s your pared-down Algorithm Mastery Tracker, focused only on the topics you’ve already studied:

## [General Notes](general-notes.md)

Using this for general algorithm descriptions

- [prefix_sum](general-notes.md#prefix-sum)
- [trees](general-notes.md#trees)
  - [dfs](general-notes.md#depth-first-search)
  - [bfs](general-notes.md#breath-first-search)
  - [binary search](general-notes.md#binary-search)
- [graphs](general-notes.md#binary-search)
  - [array of edges](general-notes.md#first-input-format-array-of-edges-see-number-of-connected-components)
  - [adjacency list](general-notes.md#second-input-format-adjacency-list)
  - [adjacency matrix](general-notes.md#third-input-format-adjacency-matrix-see-number-of-provinces)
  - [matrix](general-notes.md#last-input-format-matrix-see-number-of-islands)
  - [code between graphs and trees](general-notes.md#code-differences-between-graphs-and-trees)

## 🔢 Arrays & Strings

| Done | Pattern             | Practice                                                                                                                                     | Notes                                                                                         |
| :--- | :------------------ | :------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------- |
| ✅   | Two Pointers        | [LeetCode 283 – Move Zeroes](https://leetcode.com/problems/move-zeroes/)                                                                     | [In-place manipulation](solutions/move-zeros.md)                                              |
| ✅   | Sliding Window      | [LeetCode 3 – Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/) | [Track sliding window with dict](solutions/longest-substring-without-repeating-characters.md) |
| ✅   | Prefix Sum          | [LeetCode 560 – Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/)                                                 | [Use hashmap for cumulative sums](solutions/subarray-sum-equals-k.md)                         |
| ✅   | Prefix Sum          | [LeetCode 525 – Contiguous Array](https://leetcode.com/problems/contiguous-array/)                                                           | [Track running count of 0s and 1s → prefix sum trick](solutions/contiguous-array.md)          |
| ⬜   | Prefix Sum + Modulo | [LeetCode 974 – Subarray Sums Divisible by K](https://leetcode.com/problems/subarray-sums-divisible-by-k/)                                   | Use hashmap to count prefix_sum % k                                                           |
| ⬜   | Prefix Sum + Index  | [LeetCode 325 – Maximum Size Subarray Sum Equals k](https://leetcode.com/problems/maximum-size-subarray-sum-equals-k/)                       | Store earliest index of each prefix sum                                                       |
| ⬜   | Prefix Sum + Binary | [LeetCode 930 – Binary Subarrays With Sum](https://leetcode.com/problems/binary-subarrays-with-sum/)                                         | Count subarrays with sum = goal using hashmap                                                 |
| ⬜   | Prefix Sum + Odd    | [LeetCode 1248 – Count Number of Nice Subarrays](https://leetcode.com/problems/count-number-of-nice-subarrays/)                              | Transform to prefix sum of odd counts                                                         |
| ⬜   | String Manipulation | [LeetCode 14 – Longest Common Prefix](https://leetcode.com/problems/longest-common-prefix/)                                                  | Clean string traversal logic                                                                  |

## 🧮 Hashing

| Done | Pattern         | Practice                                                                                                   | Notes                                       |
| :--- | :-------------- | :--------------------------------------------------------------------------------------------------------- | :------------------------------------------ |
| ⬜   | Frequency Count | [LeetCode 387 – First Unique Character](https://leetcode.com/problems/first-unique-character-in-a-string/) | Use collections.Counter                     |
| ⬜   | Hashmap Lookup  | [LeetCode 1 – Two Sum](https://leetcode.com/problems/two-sum/)                                             | Classic hashmap pattern                     |
| ⬜   | Grouping        | [LeetCode 49 – Group Anagrams](https://leetcode.com/problems/group-anagrams/)                              | Use tuple of counts or sorted string as key |

## 🔗 Linked Lists

| Done | Pattern            | Practice                                                                                      | Notes                   |
| :--- | :----------------- | :-------------------------------------------------------------------------------------------- | :---------------------- |
| ⬜   | Fast/Slow Pointers | [LeetCode 141 – Linked List Cycle](https://leetcode.com/problems/linked-list-cycle/)          | Floyd’s cycle detection |
| ⬜   | Reversal           | [LeetCode 206 – Reverse Linked List](https://leetcode.com/problems/reverse-linked-list/)      | Iterative and recursive |
| ⬜   | Merge Lists        | [LeetCode 21 – Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/) | Use dummy node pattern  |

## 📚 Stacks & Queues

| Done | Pattern           | Practice                                                                                 | Notes                       |
| :--- | :---------------- | :--------------------------------------------------------------------------------------- | :-------------------------- |
| ⬜   | Monotonic Stack   | [LeetCode 739 – Daily Temperatures](https://leetcode.com/problems/daily-temperatures/)   | Track indices with stack    |
| ⬜   | Valid Parentheses | [LeetCode 20 – Valid Parentheses](https://leetcode.com/problems/valid-parentheses/)      | Use stack to match pairs    |
| ⬜   | Queue Simulation  | [LeetCode 933 – Number of Recent](https://leetcode.com/problems/number-of-recent-calls/) | Calls Use collections.deque |

## 🌲 Trees

| Done | Pattern            | Practice                                                                                                 | Notes                        |
| :--- | :----------------- | :------------------------------------------------------------------------------------------------------- | :--------------------------- |
| ⬜   | DFS Traversal      | [LeetCode 144 – Preorder Traversal](https://leetcode.com/problems/binary-tree-preorder-traversal/)       | Recursive and iterative      |
| ⬜   | BFS Traversal      | [LeetCode 102 – Level Order Traversal](https://leetcode.com/problems/binary-tree-level-order-traversal/) | Use queue for level tracking |
| ⬜   | Depth Calculation  | [LeetCode 104 – Max Depth](https://leetcode.com/problems/maximum-depth-of-binary-tree/)                  | Classic recursive DFS        |
| ⬜   | Symmetry / Balance | [LeetCode 101 – Symmetric Tree](https://leetcode.com/problems/symmetric-tree/)                           | Mirror check with recursion  |

## 🧭 Graphs (Just Starting)

| Done | Pattern                  | Practice                                                                                                                                                                | Notes                                                                                                                 |
| :--- | :----------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------- |
| ✅   | DFS on Grid              | [LeetCode 200 – Number of Islands](https://leetcode.com/problems/number-of-islands/)                                                                                    | [Use visited set + queue](solutions/number-of-islands.md)                                                             |
| ✅   | BFS on binary tree       | [LeetCode 199. Binary Tree Right Side View](https://leetcode.com/problems/binary-tree-right-side-view/)                                                                 | [use a queue / "deque" in python](solutions/binary-tree-right-side-view.md)                                           |
| ✅   | BFS using DFS            | [LeetCode](https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/)                                                                                     | [during DFS maintain results in global array indexed by level](solutions/binary-tree-zigzag-level-order-traversal.md) |
| ⬜   | DFS on Grid              | [LeetCode 695 – Max Area of Island](https://leetcode.com/problems/max-area-of-island/)                                                                                  | Recursive DFS with bounds check                                                                                       |
| ⬜   | Adjacency List Traversal | [LeetCode 133 – Clone Graph](https://leetcode.com/problems/clone-graph/)                                                                                                | Use dict + DFS/BFS                                                                                                    |
| ✅   | Adjacency List Traversal | [LeetCode 547- Number of Provinces](https://leetcode.com/problems/number-of-provinces/)                                                                                 | [Use set/dict + DFS/BFS](solutions/number-of-provinces.md)                                                            |
| ✅   | Array of Edges Traversal | [LeetCode 323. Number of Connected Components in an Undirected Graph](https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/description/) | [Use set/dict + DFS/BFS](solutions/number-of-connected-components.md)                                                 |

✅ Strategy for the Week
Focus on medium-level problems in these categories.
Practice explaining your approach in writing — Amazon scores this in the OA.
Use Python’s built-in tools: collections.Counter, deque, set, dict, recursion, and list slicing.

If you want, I can also build a daily study plan for the next 5–6 days using just these topics — so you know exactly what to practice each day leading up to the OA. Want me to set that up next?
