# Intro To Ruby: Methods


| Objectives: Students will be able to... |
|:--- |
| Compare and contrast functions in Ruby and JavaScript. |
| Write methods in Ruby to solve problems. |

### Parts of A Language

* `Primitives`
* `Combinations`
* **`Abstractions`**


### Some Abstractions

#### Javascript

* Function
    * Anonymous: `function (param1, [..param2, [...]]){...}`,
    * Named: `function Name(param1, [..param2, [...]]){...}`
    * Use *lexical scope* (look up variables in outer scopes)
    * Captures scope (think of closures)
    * Used as values, passed around like other variables
    * Require explicit `return`
    * All parameters are optional

#### Ruby

 * Function
    * Uses `def`
    * Does not capture scope
    * Not used as values or passed around
    * Optional parameters must be specified
    * Implicitly returns last evaluation

* Block
    * Used with `.each`, `.map`, et cetera

    ```
    some_method do |param1, [param2, [...]]
        # some code
    end

    ```
    * Captures scope

##Ruby Methods

### Syntax

#### Define a method

Ruby uses the `def` reserved word to create a method. The method definition must finish with the word `end`.  In the console (and in these notes), the value returned by a function will have `=>` in front of it.  If you look at the first example below, the `say_hello` function returns `nil`. 

```ruby
def say_hello
  puts "Hello"
end

say_hello
# Hello
# => nil
```

#### Define a method with a parameter

```ruby
def say(something)
  puts something
end

say('hello')
# hello
# => nil

say 'gello'
# gello
# => nil
```

Note: You don't have to use parentheses when listing a method's parameters (or calling a method), but it can make it easier to read. The following would also work for the first line of the snippet above: `def say something`


#### Define a method that operates on two parameters

```ruby
def add_numbers(first, second)
  puts first + second
end

add_numbers(1,2)
# 3
# => nil
```

### Conventions

#### Define a method that returns true or false

If a function returns true or false, we add a `?` to the end as a convention. The `?` doesn't "do" anything within the Ruby language, but it lets other programmers know this is a boolean function. It's just a convention.

```ruby
def can_vote?(age)
  if age >= 18
    return true
  else
    return false
  end
end
```

#### Define a method that changes the input

Another important convention is adding a `!` to the name of methods that directly change the input. Again, the `!` doesn't do anything within Ruby, but it lets later developers know what's up.

```ruby
scores = [9, 3, 7, 8, 4, 6, 6, 5]

scores.sort
# => [3, 4, 5, 6, 6, 7, 8, 9]

p scores
# [9, 3, 7, 8, 4, 6, 6, 5]  # original array stays the same

scores.sort!
# => [3, 4, 5, 6, 6, 7, 8, 9]

p scores
# [3, 4, 5, 6, 6, 7, 8, 9]  # now the sort! method has changed the original array

```

### Rules

#### Methods in Ruby always return the value of the last evaluated expression

Why aren't we `return`ing anything from most of these methods?  Well, methods in Ruby automatically return the value of the last expression evaluated, so we almost never actually have to use the word `return`.


```ruby
def implicitly_return_5
  if true
    5
  end
end

implicitly_return_5
# => 5
```

Sometimes, we do have to use the reserved word `return`. The best example is if we might to break out of a loop early. 

```ruby
def forever_loop
   random_generator = Random.new       # this will generate random numbers for us
   while 1 > 0
      if random_generator.rand(0..1) == 1    # a random number out of 0 or 1
         puts "You finally break out!"
         return
      end
      puts "Still looping..."
   end
end
```

<!--This next example simulates a kid taking 3 swings at a pinata. It returns the number of swings remaining at the end of the kid's turn (usually 0). But! each swing might burst the pinata. We use random chance to determine if the pinata bursts. If it does, the method shows a message that the pinata burst and returns early.-->

<!--```ruby-->
<!--def pinata  -->
<!--   remaining_swings = 3-->
<!--   rand_gen = Random.new            # this will generate our random numbers-->
<!--   while remaining_swings > 0-->
<!--      if rand_gen.rand(0..4) == 4   # random number out of 0, 1, 2, 3, or 4-->
<!--         puts "You burst the pinata!"-->
<!--         return remaining_swings-->
<!--      end-->
<!--      remaining_swings = remaining_swings - 1-->
<!--      puts "#{remaining_swings} swings left!"-->
<!--   end-->
<!--   remaining_swings-->
<!--end-->

<!--# one possible output is:-->
<!--# 2 swings left!-->
<!--# 1 swings left!-->
<!--# You burst the pinata!-->
<!--# => 1-->

<!--```-->



#### Printing/logging and returning are different

Why did we get a `nil` return value when we `puts` (above)?

The `puts` and `print` methods in Ruby are like `console.log` in JavaScript: they print out a value, but they don't return anything. If they're the last expression evaluated, we get the default return value `nil`.  The only difference between *those* two methods is that `puts` adds a new line character ('\n') to the end of the string it prints out.  

A third printing method, called `p`, prints a thing out in a more carefully formatted way based on the thing's `.inspect` method, and it also returns the value.  Programmers can customize `.inspect` to give complex objects a better format for printing.  

```ruby
def list_numbers_quietly(first, second)
  [first, second]
end

list_numbers_quietly(1,2)
# => [1, 2]

puts list_numbers_quietly(3,4)
# 3
# 4
# => nil

p list_numbers_quietly(5,6)
# [5,6]
# => [5, 6]
```

 The `puts` method is the most commonly used one for printing/logging.


#### Parameters can have default values

Sometimes it's useful to let a function assume a default value for one or more of its parameters. 

```ruby
def say(message = "Hello")
  puts message
end

say
# Hello
# => nil

say "Goodbye"
# Goodbye
# => nil
```

JavaScript doesn't have this functionality built in, so we might have used this trick:

```js
function say(message) {
   message = message || "Hello";  // if no argument is given, this sets message to "Hello"
   console.log(message);
}
```


#### Recursion: methods can call themselves

```ruby
def recurse(depth)
  if depth > 0
    puts "#{depth} spiraling down..."
    recurse(depth - 1)
    puts "#{depth} spiraling up..."
  else
    puts "Bottom of the rabbit hole"
  end
end

recurse 3

# 3 spiraling down...
# 2 spiraling down...
# 1 spiraling down...
# Bottom of the rabbit hole
# 1 spiraling up...
# 2 spiraling up...
# 3 spiraling up...
# => nil
```


#### Functions have locally scoped variables (biggest difference from JavaScript!)

The following code won't change `foo`. Why?

```ruby
foo = 1

def do_stuff
  foo += 1           
  bar = 1 
  puts foo           
  puts bar        
end

do_stuff
# undefined method `+' for nil:NilClass
# (from the first line in do_stuff definition)

puts foo
# 1
# => nil

puts bar
# undefined local variable or method `bar' for main:Object
```

The problem is that Ruby functions are *entirely* locally scoped -- code within a function only has access to the function's parameters and any variables defined inside of the function.

```ruby
foo = 1        # this foo is 1

def do_stuff
  foo = 1      # this other foo is 1
  foo += 1     # other foo is 2
  bar = 1      # bar is 1
  puts foo
  puts bar
end

do_stuff
# 2
# 1
# => nil

puts foo
# 1      # first foo is still one!
# => nil

puts bar    
# undefined local variable or method `bar' for main:Object
# (because bar was only inside function)
```

So how do we let functions know about variables that are defined outside the function definition? Pass them in!

```ruby

foo = 1      # first foo is 1

def do_other_stuff(x)
  foo = x         # other foo is set to x
  foo += 1        
  bar = 1
  puts foo
  puts bar
end

puts do_other_stuff(foo)   # pass in the first foo (in place of x)
# 2
# 1
# => nil

puts foo
# 1      # note that first foo still hasn't changed
# => nil
```

###Example: Factorial

A simple, common interview question asks candidates to compute the *factorial* of a number. (The factorial of a number just multiplies it by all lower positive numbers. For example, `6` factorial (written `6!`) is  `6*5*4*3*2*1`, which equals `720`.)


```ruby
def factorial(num)
   if num > 1
      num * factorial(num-1)
   elsif num == 1 or num == 0
      1
   else
      puts "can't do factorial of a negative number!"
   end
end

factorial(6)
# => 720

factorial(-1)
# can't do factorial of a negative number!
# => nil
```

## How to run a ruby script inside a file

1. `touch script.rb` in the Terminal to create your file
2. `sublime script.rb` - open it up and add some content
3. `ruby script.rb` from the Terminal to run the file!
4. THAT'S IT!
5. From inside irb, you can run a Ruby file by loading it: `load './filename.rb'`

## How to use gems in irb

Gems in Ruby are a lot like node modules. Say you want to use a gem like "Awesome Print" to make your printing of objects and strings colorized and indented?

1. First install the gem on your computer: `gem install awesome_print`.
2. Now just require it at the top of your file or in irb and then use it according to its documentation. For example, use the `ap` command:
  ```ruby
  require 'awesome_print'
  a = ["value1", "value2", "value3"]
  ap a
  ```
  
[Ruby Toolbox](https://www.ruby-toolbox.com/) lists other popular gems!

