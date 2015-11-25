# Tree Week!

This week we'll add trees to our collection of abstract data structures.

## Graphs

In computer science, graphs are collections of **vertices** or **nodes**, which usually store or represent some data, and **edges**, which connect the nodes. Each edge connects two nodes together.  If you think of nodes as airports, edges would be the flight paths between them.  Here are some use cases for graphs:

* graph databases
* relationships among users in a social network
* links between pages on a website
* finding a route between two locations
* planning the order of classes to take based on prerequisites 

A sequence of edges is called a "path".

<!--<img src="images/paths.jpg" width="300px">-->

## Trees

Trees are a special kind of graph with some extra rules about their nodes and edges. First, every tree has a unique, special start node called the "root" node. 
(We usually draw trees vertically with the "root" node at the top of the tree.)Second, each node in a tree can only ever have one "parent". This means there's only ever one direct path from any node to the root of the tree.  One classic example of a tree is a file sytem, where directories contain other directories and/or files. The `/` directory is called the "root" directory because it's literally the root of the computer's directory tree.  Here are a few other example use cases of trees:

* the DOM tree
* comment trees (where users can comment on comments)
* data compression algoritm trees (Huffman coding)
* tournaments 
* parser trees or syntax trees that help interpret code
* calculators

The edges in a tree are sometimes referred to as "branches".  Nodes of the tree that do not have any children are called "leaves" because no branches lead away from them. The length of the longest path from the root to a leaf is called the tree's "height".

<img src="images/tree_terms.jpg" width="300px">


Tree data structures adopt language from family trees. If an edge in a tree connects two nodes, the one closer to the root is the "parent", and the other is a "child".  From the perspective of a single node, some other nodes will be on the path between that node and the root. These are the node's "ancestors." Other nodes might be children of the  node, or children of the node's children. These are called the node's "descendants."  Nodes that share the same "parent" can be called "siblings," but that's rarer.


## Trees to Know for Interviews

### Balanced Binary Search Trees

Balanced Binary Search Trees (balanced BSTs) are trees, binary trees, binary search trees, and balanced trees.  

#### Binary Trees

The most common types of trees for interviews are "binary trees," which allow each node to have up to 2 children. We say each node can have a "left child" and a "right child."  The left child can be considered the root of a "left subtree", and the right child can be considered the root of a "right subtree".

#### Binary Search Trees

Binary search trees add on an extra restriction to binary trees. In each node's left child subtree (if it has one), all nodes will will have values *less* than the original node's value.  In each node's right child subtree (if it has one), all nodes must have a **greater** value than the original node itself. Left is less!


<img src="images/bst.jpg" width="300px">


#### Balanced Binary Trees

Balanced binary trees are another basic variant of binary trees. A "balanced" tree has a height about as low as it can possibly be while still holding all its nodes.  For binary trees, that means the height is `O(log`<sub>`2`</sub>`(n))` (or just `O(log(n))`), where `n` is the number of nodes in the tree.  There are different definitions of exactly how to balance a tree, but you can tell a tree is balanced if all of the leaves are either at the very bottom level of the tree or just one level higher.

#### And finally... Balanced Binary Search Trees

Balanced binary search trees combine the balanced structure requirement with the node value requirement of binary search trees.  If an interview question asks about a tree, it's probably a balanced binary search tree. Ask your interview to clarify, though, whether the tree is balanced and whether it is a binary search tree. 


### N-ary or K-ary Trees

N-ary trees don't have to be binary; their nodes can have more than two children. These are also known as "just regular trees" and have the characteristics defined for all trees above. 

### Tries

Tries, also called prefix trees, store data differently than other trees we'll look at. The data is only stored in the leaves, and it builds up over the path from the root to each leaf.   Here's an example:

<img src="images/trie.jpg" width="300px">

Specialized tries that store data in binary format (as sequences of 0s and 1s) are used by most hardware routers to send data across the internet. They allow for fast lookup within their limited set of stored sequences, so they're often used with words (sequences of letters!) for autocomplete, spell checking, or other string matching scenarios.

## Challenges

PLEASE DO NOT CODE UNLESS A CHALLENGE SPECIFICALLY INSTRUCTS YOU TO

### Binary Search Trees

Assume for the following challenges that you have a binary search tree data structure. The structure will be recursive, meaning each node is actually represented as a full subtree, an instance of `BinarySearchTree`. 

The constructor for a `BinarySearchTree` instance requires that you specify the value for the current node, and it sets the left and right subtrees/nodes to  `None` (or `nil` or `null` depending on what programming language you're using; the "pseudocode" solutions use `None`).

The data structure allows you to do the following:

* given a tree called `my_bst`, access the "root node" with `my_bst`
* given any node, find the parent of that node with `my_node.parent` (the parent of the root node is `None`)
* given any node, find the left child node/subtree of that node with `.left`
* given any node, find the right child node/subtree of that node with `.right`
* given any node, find its value with `.value`

1. You have a binary search tree containing the records for every student in your class, where the value stored in each node is the timestamp when the student enrolled in the class.  Pseudocode a function to find the first student who enrolled in the class.  Pseudocode a function to find the last student who enrolled in the class.

	Old: Pseudocode a `min` function to find the minimum-valued node in a binary search tree. Pseudocode a `max` function to find the maximum-valued node in a binary search tree.  What is another data structure you could use to find the minimum or maximum value in a set of numbers? How does using a binary search tree compare to using an unsorted array? A sorted array?

	```python

	def min(tree):
		current_node = tree
		while current_node.left is not None:
			current_node = current_node.left
		return current_node.value


	def max(tree):
		current_node = tree
		while current_node.right is not None:
			current_node = current_node.right
		return current_node.value
	```




1. You have a binary search tree where the value of each node is the difficulty rating of a quiz stored in that node.  Pseudocode a `search` function to check if any of the quizzes have a particular difficulty rating. Your function should return `true` if there is a quiz with that difficulty rating and `false` if not.

	Old: Pseudocode a `search` function to check if any node in the binary search tree has a given value. Your function should return `true` if the value is in the tree and `false` if not. 

	Note: The best worst-case run time for a `search` function for a binary search tree is the height of the tree, which for a balanced BST is `O(log<sub>2</sub>n)` where `n` is the number of nodes.

	```python


	def search(tree, val):
		current_node = tree
		while current_node is not None:
			if current_node.value > val:
				current_node = current_node.left
			else if current_node.val < val:
				current_node = current_node.right
			else:
				return true
		return false
	```


1. You're keeping track of this month's temperatures in a binary search tree. Pseudocode an `insert` function to insert a new node into the binary search tree with a given temperature value. The result must still be a binary search tree, but don't worry about keeping it balanced.  (If the binary search tree were balanced, how much time would it take to insert something into a tree with n nodes? How much time would it take to insert something into a sorted array of length n?)

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





<!-- 1. You're getting a giftcard in an undisclosed amount for your birthday.  You have a list of items you want stored in a binary search tree with each node's "value" as the price of an item.  Pseudocode a function to find the highest price item that you can afford, given the amount of the giftcard.

	Old: Pseudocode a function that, given a value, finds the node in the tree with the highest value lower than the given value. 

	```python

	def lower_than(value)
		current_node = tree
		while current_node is not None
			if current_node.val >= val
				current_node = current_node.left
			else
				current_node = current_node.right
 -->
<!-- 
1. Every royal your kingdom is assigned a unique "distance from the throne" score that helps determine the line of succession should something happen to the current monarch.  A royal cousin has asked you to find out, if he were to take the throne and then have to leave it, who would replace him. The royal cousin gives you access to his score, so you have his node in the "distance from the throne" binary search tree. Pseudocode a `successor` function to find the person (node) who is next in line after him.  If there is no one with a higher "distance from the throne" score, return None. 

	Old: Pseudocode a `successor` function to find the next-highest-valued node in a binary search tree, given one node/subtree. If there is no higher-valued node, return None. (The corresponding term for the next-lowest is `predecessor`).

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

### Other Tree Structures


Assume for the following challenge that you have a tree data structure. The structure will be recursive, meaning each node is actually represented as a full subtree, an instance of `Tree`. Since this is a general tree, it will have different methods than the binary search tree.

The constructor for a `Tree` instance requires that you specify the value for the current node, and it sets `children` list of the node to an empty array.

The data structure allows you to do the following:

* given a tree called `my_tree`, access the "root node" with `my_tree`
* given any node, find the parent of that node with `my_node.parent` (the parent of the root node is `None`)
* given any node, find an array containing all its children with `.children`
* given any node, find its value with `.value`

1. Given the names of two people in a military group, and a tree that represents the military heirarchy, your task is to find the lowest-rank person who commands both of the other people (this excludes the people themselves). If there is no such person, return `None`.  

	Old: Pseudocode a `lowest_common_ancestor` function that, given two nodes/subtrees, finds their lowest common ancestor, excluding themselves, or returns `None`.

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

1. A "min heap" is another abstract data structure often thought of as a type of binary tree. It has a few additional restrictions, including one called the "min heap property:" every node's value is less than the values of its children. What is special about the root of a min heap?  

1. Create a trie for the following word list: ["hey", "hello", "howdy", "g'day"].

1. Add the phrase "hello, govnuh" to your trie from above. 

1. In a normal tree, the number of nodes determines the tree's minimum possible height. What determines the minimum possible height of a trie?  

1. Can you think of a way to modify the trie data structure you just created to store the same data with a shorter tree? 

```
	Radix tree
```



