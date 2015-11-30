# Trees!

## Quick Reference

Graph 
* stores data in vertices (nodes)
* vertices connected by edges that signify relationships or transitions
* edges can be undirected (two-way) or directed (one-way)

Tree 
* type of graph
* rooted
* edges/branches all directed (one-way), away from the root
* acyclic (doesn't allow cycles or circular paths)
* each node can have only one parent / only one branch leading into it

Binary Search Tree (very common in interviews)
* stores sorted data (keys have to be sortable)
* max number of children per node: 2
* left subtree of any node has all keys less than or equal to the node's key
* right subtree of any node has all keys greater than or equal to the node's key
* height with `n` nodes:
	if balanced, `O(log(n))`
	if not balanced, `O(n)`
* each node has a key and usually some extra associated data we care about

Trie 
* kind of tree
* stores sequential data
* each branch adds to the sequence
* nodes that are the end of a word or sequence are marked as such
* height not determined by number of nodes



## Challenges

PLEASE DO NOT CODE UNLESS A CHALLENGE SPECIFICALLY INSTRUCTS YOU TO

### Base Challenges (Skip)

1. By hand on the whiteboard, create a binary search tree from the following array: [0,1,2,3,4,5,6]. 

1. Create a trie for the following word list: ["hey", "hello", "howdy", "g'day"].

1. Add the phrase "hello, govnuh" to your trie from above. 

1. In binary search trees and n-ary trees, the number of nodes and the amount of children allowed per node determine the tree's minimum possible height. What determines the minimum possible height of a trie?  

1. Can you think of a way to modify the trie data structure you just created to store the same data with a shorter tree? 

1. A "min heap" is another abstract data structure often thought of as a type of binary tree. It has a few additional restrictions, including one called the "min heap property:" every node's key is less than the keys of its children. What is special about the root of a min heap?  

## Binary Search Tree

Assume for the following challenges that you have a binary search tree data structure. The structure will be recursive, meaning each node is actually represented as a full subtree, an instance of `BinarySearchTree`. 

The constructor for a `BinarySearchTree` instance requires that you specify the key for the current node, and it sets the left and right subtrees/nodes to  `None` (or `nil` or `null` depending on what programming language you're using; the "pseudocode" solutions use `None`). 

The data structure allows you to do the following:

* given a tree called `my_bst`, access the "root node" with `my_bst`
* given any node, find the left child node/subtree of that node with `.left`
* given any node, find the right child node/subtree of that node with `.right`
* given any node, find its key with `.key`


1. You follow a favorite literary critic's book ratings very closely.  In particular, you keep a self-balancing binary search tree of all the critic's reviews, where each node's key is the rating given by the critic to that node's book.  Every time the critic publishes a new book review, you add it to the tree. Every time you finish reading your current book, you read the next highest-rated book. As a first step to automating your book selection process, pseudocode a `max` function to find the book in the tree with the highest rating. Your function should take the tree as its argument. (If you were also deleting the item, this is how you'd use a binary search tree as a 'priority queue'.)
	

1. You run a website where users can assign creative names to colors. You store named colors as nodes in a self-balancing binary search tree, where the key of a node is the hex code of its color (for example: `#30af99`, `#c0ffee`). Each node also contains the name assigned to the color, the username of the user who named it, and the date and time when it was named. Users shouldn't be able to change the name of a color.  Pseudocode a `has_key` function to check if a particular hex value is already in the tree.  If the key is in the tree, your function should return `true`. If the key is not in the tree, your function should return `false`. Your function should take the tree and the hex color key as arguments.


	Stretch Version: Pseudocode an `insert_if_free` function to check if the color exists *and* insert it if it's not already in the tree. If the key is not in the tree, your function should add it to the tree and return `true` (notice this is the reverse of what `has_key` returns).  If the key is already in the tree, your function should return `false`. Your function should take the tree as one argument and the information about the new color as one or more other arguments.  Don't worry about maintaining the balance of the tree; just insert the new node at any valid location.




## Trie

Assume you have a `Trie` data structure.   The constructor for a `Trie` instance requires that you specify the value/symbol of the branch leading into the new node, and it sets `children` list of the node to an empty array. If the new node is to be the root of a Trie, its key should be `"root"` as a special start signal. (This is not a convention, just a choice made by whoever designed this trie.) 

The data structure allows you to do the following:

* given a tree called `my_trie`, access the "root node" with `my_trie`
* given any node, find an array containing all its children with `.children`
* given any node, find the symbol on the branch leading into it with `.symbol`. 

1. Your site has a list of options users can choose for frozen yogurt flavor. You've already converted the list to a trie, but now the frozen yogurt vendor wants to be able to add new flavors. Describe an algorithm to insert a new flavor into the trie. It should not add the flavor again if it's already in the trie.


### Tree


Assume for the following challenge that you have a recursive tree data structure. 

The constructor for a `Tree` instance requires that you specify the key for the current node, and it sets `children` list of the node to an empty array.

The data structure allows you to do the following:

* given a tree called `my_tree`, access the "root node" with `my_tree`
* given any node, find an array containing all its children with `.children`
* given any node, find its key with `.key`

In addition, as a special bonus not always available in trees, you can:   
* given any node, find its parent node with `.parent` (the parent of the root node is `None`)

1. Given the names of two people in a military group, and a tree that represents the military heirarchy, your task is to find the lowest-rank person who commands both of the other people (this excludes the people themselves). If there is no such person, return `None`.  This is often called a  `lowest_common_ancestor` function.
