##
# This class represents a *sorted*
# tree with _exactly_ _two_ _subtrees_.
# Follow the link for more info on
# {Sorted Binary Search Trees}[https://en.wikipedia.org/wiki/Binary_search_tree]

class BinaryTree

  attr_accessor :value, :left, :right

  ##
  # :attr_accessor: value
  # read or write the value of the tree
  #
  #  my_tree = BinaryTree.new()
  #  my_tree.value = 5
  #  #=> 5
  #  my_tree.value
  #  #=> 5

  ##
  # :attr_accessor: right
  # initializes and reads the +right+ subtree for the instance
  #
  #   my_tree = BinaryTree.new()
  #   #=> #<BinaryTree:0x007ff8a412a710 ... >
  #
  #   my_tree.right
  #   #=> nil
  #
  #   my_tree.right = BinaryTree.new()
  #   #=> #<BinaryTree:0x007ff73e00e690 ...>
  #
  #   my_tree.right
  #   #=> #<BinaryTree:0x007ff73e00e690 ...>

  ##
  # :attr_accessor: left
  # initializes and reads +left+ subtree 
  # for an instance. See #right for usage.

  ##
  # Creates a new binary tree 
  # with the optional +val+ param 
  # as the @value for the instance
  #
  #  my_tree = BinaryTree.new
  #  #=> #<BinaryTree:0x007ff8a4073790 @value=nil>
  #
  # or pass in an initial value
  #
  #  my_tree = BinaryTree.new(8)
  #  #=> #<BinaryTree:0x007ff8a412a710 @value=8> 
  #  my_tree.value
  #  #=> 8

  def initialize(val=nil)
    @value = val
  end

  ##
  # helper method to check if both 
  # +@left+ and +@right+ subtrees are +nil+

  def leaf?
    @left.nil? && @right.nil?
  end

  ##
  # will determine where to place a
  # new +val+: @value, @left, or @right. 
  #
  # If the instance already has a +#value+ then a 
  # new value will be placed in either the +#left+
  # or +#right+ subtrees if new +val+ is
  # less than or greater than +#value+ respectively.
  #
  #   my_tree = BinaryTree.new(5)
  #   #=> #<BinaryTree:0x007ff73e014f90 @value=5>
  #   
  #   # for a new val less than 5 it is inserted left
  #   my_tree.insert(4)
  #   #=> #<BinaryTree:0x007ff73e014f90 @value=5 @left=#<BinaryTree:0x007ff73c06a2f8 @value=4>>
  #
  #   # for a new +val greater than or equal to 5 it is inserted to right
  #   my_tree.insert(6)
  #   #=> #<BinaryTree:0x007ff73e014f90 @value=5 @left=... @right=#<BinaryTree:0x007ff73c06a2f8 @value=6>>

  def insert(new_val)

    if (@value.nil?)
      @value = new_val
      self
    else
      if new_val < @value
        @left = @left || BinaryTree.new
        @left.insert(new_val)
      else
        @right ||= BinaryTree.new
        @right.insert(new_val)
      end
    end

    # Terminal Condition
      # if value of tree is nil
      #   then set value to new_val
    # Recursive Condition
      # else 
      #   if new_val less than value
      #      then left.insert(new_val)
      #   else then it's greater than equal to
      #      so then we right.insert(new_val)
  end

  ##
  # A method to check if +val+ is in tree
  # that returns +true+ if in the tree 
  # and +false+ if not.

  def include?(val)

  end

  ##
  # Will calculate the height of 
  # a BinaryTree by traversing 
  # each sub-tree  

  def height
  
  end

  ##
  # method to convert the tree to a sorted array
  def in_order_traversal
    puts "starting in_order_traversal with value #{@value}"
     # base case / terminal condition
    if leaf?
      p [@value]
      return [@value]
    else
      subarr = []
      puts "left of #{@value}"
      if @left
        p @left
        subarr = subarr + @left.in_order_traversal
      end
      puts "at #{@value}"
      subarr = subarr + [@value]
      p subarr
      puts "right of #{@value}"
      if @right
        p @right
        subarr = subarr + @right.in_order_traversal
      end
      p subarr
      return subarr
    end
  end



  ##
  # returns the depth of the first empty subtree (missing child)
  # uses breadth first search
  def first_empty_depth
    
  end

  ##
  # checks if tree is balanced by comparing height
  # to the depth of the first empty subtree
  def balanced?

  end

end

mytree = BinaryTree.new(50)
mytree.insert(25)
mytree.insert(75)
mytree.insert(13)
mytree.insert(37)
mytree.insert(63)
mytree.insert(87)

p mytree

mytree.in_order_traversal
