# Tree Week!

This week we'll add trees to our collection of abstract data structures.

## Quick Reference

Graph (not as frequent in interviews)
* stores data in vertices (nodes)
* vertices connected by edges that signify relationships or transitions
* edges can be undirected (two-way) or directed (one-way)

Tree (not as frequent in interviews)
* rooted
* edges/branches usually considered to be directed (one-way) away from the root
* doesn't allow circular paths (cycles)
* each node can have only one parent / only one branch leading into it

Binary Search Tree (very common in interviews)
* stores sorted data (keys have to be sortable)
* max number of children per node: 2
* left subtree of any node has all keys less than or equal to the node's key
* right subtree of any node has all keys greater than or equal to the node's key
* height with `n` nodes:
	if balanced, `O(log(n))`
	if not balanced, `O(n)`
* each node has a key we care about

Trie (not as frequent in interviews)
* stores sequential data
* each branch adds to the sequence
* nodes that are the end of a word are marked as such
* height not determined by number of nodes



## Challenges

PLEASE DO NOT CODE UNLESS A CHALLENGE SPECIFICALLY INSTRUCTS YOU TO

### Base Challenges (Skip)

1. By hand on the whiteboard, create a binary search tree from the following array: [0,1,2,3,4,5,6]. 

1. Create a trie for the following word list: ["hey", "hello", "howdy", "g'day"].

1. Add the phrase "hello, govnuh" to your trie from above. 

1. In plain and in n-ary trees, the number of nodes and the amount of children allowed per node determine the tree's minimum possible height. What determines the minimum possible height of a trie?  

1. Can you think of a way to modify the trie data structure you just created to store the same data with a shorter tree (2 minutes)? 

1. A "min heap" is another abstract data structure often thought of as a type of binary tree. It has a few additional restrictions, including one called the "min heap property:" every node's key is less than the keys of its children. What is special about the root of a min heap?  

## Binary Search Tree

Assume for the following challenges that you have a binary search tree data structure. The structure will be recursive, meaning each node is actually represented as a full subtree, an instance of `BinarySearchTree`. 

The constructor for a `BinarySearchTree` instance requires that you specify the key for the current node, and it sets the left and right subtrees/nodes to  `None` (or `nil` or `null` depending on what programming language you're using; the "pseudocode" solutions use `None`).

The data structure allows you to do the following:

* given a tree called `my_bst`, access the "root node" with `my_bst`
* given any node, find the left child node/subtree of that node with `.left`
* given any node, find the right child node/subtree of that node with `.right`
* given any node, find its key with `.key`

And as an extra bonus beyond the most basic tree data structures, it lets you move "up" branches against the usual direction of tree edges:

* given any node, find the parent of that node with `my_node.parent` (the parent of the root node is `None`)

1. You have a binary search tree containing the records for every student in your class, where the key stored in each node is the timestamp when the student enrolled in the class.  Pseudocode a function to find the first student who enrolled in the class.  Pseudocode a function to find the last student who enrolled in the class.

	Jargon: Pseudocode a `min` function to find the minimum-keyed node in a binary search tree. Pseudocode a `max` function to find the maximum-keyed node in a binary search tree.  What is another data structure you could use to find the minimum or maximum key in a set of numbers? How does using a binary search tree compare to using an unsorted array? A sorted array?

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


1. What is another data structure you could use to find the minimum or maximum key in a set of numbers? How does using a binary search tree compare to using an unsorted array? A sorted array? Does it matter if the binary search tree is balanced?

1. You have a binary search tree where the key of each node is the difficulty rating of a quiz stored in that node.  Pseudocode a `has_key` function to check if any of the quizzes have a particular difficulty rating. Your function should return `true` if there is a quiz with that difficulty rating and `false` if not.

	Jargon: Pseudocode a `has_key` function to check if any node in the binary search tree has a given key. Your function should return `true` if the key is in the tree and `false` if not. 

1. You're keeping track of this month's temperatures in a binary search tree. Pseudocode an `insert` function to insert a new node into the binary search tree with a given temperature key. The result must still be a binary search tree, but don't worry about keeping it balanced.  (If the binary search tree were balanced, how much time would it take to insert something into a tree with n nodes? How much time would it take to insert something into a sorted array of length n?)

<!-- 
1. Every royal your kingdom is assigned a unique "distance from the throne" score that helps determine the line of succession should something happen to the current monarch.  A royal cousin has asked you to find out, if he were to take the throne and then have to leave it, who would replace him. The royal cousin gives you access to his score, so you have his node in the "distance from the throne" binary search tree. Pseudocode a `successor` function to find the person (node) who is next in line after him.  If there is no one with a higher "distance from the throne" score, return None. 

	Jargon: Pseudocode a `successor` function to find the next-highest-keyed node in a binary search tree, given one node/subtree. If there is no higher-keyed node, return None. (The corresponding term for the next-lowest is `predecessor`).

	```python

	def successor(node):
		if node.right is None and node.parent is None:
			return None
		if node.right is not None:
			current_node = node.right
			while current_node.left:
				current_node = current_node.left
			return current_node
		else if node.parent.left is node:
			return node
		else: 
			current_node = node
			while current_node.parent is not None and current_node.parent.right is current_node:
				current_node = current_node.parent
			if current_node.parent is None:
				return None
			else:
				current_node = current_node.parent
				while current_node.left:
					current_node = current_node.left
				return current_node

	```
 -->

### Tree


Assume for the following challenge that you have a recursive tree data structure. 

The constructor for a `Tree` instance requires that you specify the key for the current node, and it sets `children` list of the node to an empty array.

The data structure allows you to do the following:

* given a tree called `my_tree`, access the "root node" with `my_tree`
* given any node, find an array containing all its children with `.children`
* given any node, find its key with `.key`

And as an extra bonus beyond the most basic tree data structures, it lets you:

* given any node, find the parent of that node with `my_node.parent` (the parent of the root node is `None`)

1. Given the names of two people in a military group, and a tree that represents the military heirarchy, your task is to find the lowest-rank person who commands both of the other people (this excludes the people themselves). If there is no such person, return `None`.  

	Jargon: Pseudocode a `lowest_common_ancestor` function that, given two nodes/subtrees, finds their lowest common ancestor, excluding themselves, or returns `None`.


## Trie

1. Your site has a list of options users can choose for frozen yogurt flavor. You've already converted the list to a trie, but now the frozen yogurt vendor wants to be able to add new flavors. Describe an algorithm to insert a new flavor into the trie. It should not add the flavor again if it's already in the trie.

 