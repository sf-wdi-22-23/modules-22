# Tree Week!

This week we'll add trees to our collection of abstract data structures.

## Challenges

PLEASE DO NOT CODE UNLESS A CHALLENGE SPECIFICALLY INSTRUCTS YOU TO

### Base Challenges


1. By hand on the whiteboard, create a binary search tree from the following array: [0,1,2,3,4,5,6]. 


  *There are many possible solutions.  Here's a balanced one:*
  
  ```
         3
      /     \
     1       5
    / \     / \
   0   2   4   6 
  ```
  
  *Here's another valid BST that's not balanced:*
  ```
        3
       / \
      2   4
     /     \
    1       5
   /         \
  0           6
  ```


1. Create a trie for the following word list: ["hey", "hello", "howdy", "g'day"].

1. Add the phrase "hello, govnuh" to your trie from above. 

1. In plain and in n-ary trees, the number of nodes and the amount of children allowed per node determine the tree's minimum possible height. What determines the minimum possible height of a trie?  

  *The length of the longest sequence/word/phrase.*

1. Can you think of a way to modify the trie data structure you just created to store the same data with a shorter tree? 

  *There are a few space-saving variants based on tries. One straightforward version, called a radix tree, merges chains of nodes that are their parent's only child -- each resulting node could be a single letter or a chunk of letters.*


1. A "min heap" is another abstract data structure often thought of as a type of binary tree. It has a few additional restrictions, including one called the "min heap property:" every node's key is less than the keys of its children. What is special about the root of a min heap?  

  *The root node of a min heap is the minimum element!  There's a similar data structure called a "max heap".*


### Binary Search Tree

1. You have a binary search tree containing the records for every student in your class, where the key stored in each node is the timestamp when the student enrolled in the class.  Pseudocode a function to find the first student who enrolled in the class.  Pseudocode a function to find the last student who enrolled in the class.

  Jargon: Pseudocode a `min` function to find the minimum-keyed node in a binary search tree. Pseudocode a `max` function to find the maximum-keyed node in a binary search tree. 

  ```python

  def min(tree):
    current_node = tree
    while current_node.left is not None:
      current_node = current_node.left
    return current_node.key


  def max(tree):
    current_node = tree
    while current_node.right is not None:
      current_node = current_node.right
    return current_node.key
  ```


1.  What is another data structure you could use to find the minimum or maximum key in a set of numbers? How does using a binary search tree compare to using an unsorted array? A sorted array? Does it matter if the binary search tree is balanced?

  *Two other possibilities are a sorted array and an unsorted array. A sorted array is pretty clearly better than an unsorted array because we can find the min by just looking at the first element or the max by looking at the last, either in `O(1)` time.  In an unsorted array, we'd have to check all the values, meaning `O(n)` time if there are `n` values.  In a binary search tree, we have to start at the root and follow a path all the way down to the leftmost or rightmost leaf. So the number of nodes we look at could be up to the height of the tree.  A non-balanced binary search tree would still potentially have us looking at all `n` values if it's just a chain of nodes (a sorted linked list).  But, with a balanced binary search tree, the height will be `O(log`<sub>`2`</sub>`n)`.*

1. You have a binary search tree where the key of each node is the difficulty rating of a quiz stored in that node.  Pseudocode a `has_key` function to check if any of the quizzes have a particular difficulty rating. Your function should return `true` if there is a quiz with that difficulty rating and `false` if not.

  Jargon: Pseudocode a `has_key` function to check if any node in the binary search tree has a given key. Your function should return `true` if the key is in the tree and `false` if not. 

  ```python


  def has_key(tree, val):
    current_node = tree
    while current_node is not None:
      if current_node.key > val:
        current_node = current_node.left
      else if current_node.val < val:
        current_node = current_node.right
      else:
        return true
    return false
  ```


1. You're keeping track of this month's temperatures in a binary search tree. Pseudocode an `insert` function to insert a new node into the binary search tree with a given temperature key. The result must still be a binary search tree, but don't worry about keeping it balanced.  (If the binary search tree were balanced, how much time would it take to insert something into a tree with n nodes? How much time would it take to insert something into a sorted array of length n?)

  ```python

  def insert(tree, val):
    current_node = tree
    while current_node is not None:
      if current_node.val > val: 
        if current_node.right is not None:
          current_node = current_node.right
        else:
          current_node.right = new BinarySearchTree(val)
      else if current_node.left is not None:
        current_node = current_node.left
      else: 
        current_node.left = new BinarySearchTree(val)
  ```


  *For a balanced binary search tree, the time would be on the order of the height, so `O(log(n))`.

### Tree

1. Given the names of two people in a military group, and a tree that represents the military heirarchy, your task is to find the lowest-rank person who commands both of the other people (this excludes the people themselves). If there is no such person, return `None`.  

  Jargon: Pseudocode a `lowest_common_ancestor` function that, given two nodes/subtrees, finds their lowest common ancestor, excluding themselves, or returns `None`.

  ```python

  def lowest_common_ancestor(node1, node2):
    current1 = node1
    current2 = node2
    node1_ancestors = set()  # a set is a list that doesn't allow duplicates; usually implemented as a hash
    node2_ancestors = set()  # we'll pretend the set() function creates a new empty set

    while current1.parent is not None and curent2.parent is not None:
      current1 = current1.parent
      if current1 in node2_ancestors:
        return current1
      else:
        node1_ancestors.add(current1)

      current2 = current2.parent
      if current2 in node1_ancestors:
        return current2
      else:
        node2_ancestors.add(current2)

    while current1.parent is not None
      current1 = current1.parent
      if current1 in node2_ancestors:
        return current1

    while current2.parent is not None
      current2 = current2.parent
      if current2 in node1_ancestors:
        return current2

    return None
  ```

## Trie

1. Your site has a list of options users can choose for frozen yogurt flavor. You've already converted the list to a trie, but now the frozen yogurt vendor wants to be able to add new flavors. Describe an algorithm to insert a new flavor into the trie. It should not add the flavor again if it's already in the trie.

  start with the current node at the root of the trie
  keep track of what index we're at in the string flavor
  while we still have more letters to go:
    if the next letter in the flavor is one of the current node's children
      make that child the current node
      increase the index we're at in the string flavor
    if the next letter in the flavor is not one of the current node's children
      add a new node with that letter as a child of the current node
      make that child the current node
      increase the index we're at in the string flavor
  once we have no more letters to go:
    mark the current node as the end of a word