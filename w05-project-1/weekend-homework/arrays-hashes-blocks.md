# Arrays, Hashes, & Blocks

### Objectives

- Use basic array methods including count, first, and last
- Iterate through arrays with map and each
- Use the appropriate data collection for a situation: hash vs. an object 
- Get and set values for specific hash key
- Get a list of all keys in a hash

### Preparation

- Recall the differences between use-cases and definitions for arrays & hashes (JS objects)
- Iterate on, get information out of, and put information into arrays & hashes

## Intro (5 mins)

Because you'll be using arrays & hashes so, so much in your time as a developer, we want to get you up to speed with how to work with them.

For these Ruby data collections, you'll be reminded of similar ideas in JS. That's fantastic. Anytime you can draw on that connection to help yourself guess at what methods might exist, or even just what to Google, you'll be in good shape.

## Working with Arrays - Demo (20 mins)

Just as a refresher – what are arrays for? What do they do? **They're for holding an ordered collection of values**, that's it.

#### Making Arrays, Adding to Arrays

So, let's start simple – we make arrays in Ruby the same as we did in JS. Nothing unexpected here.

```ruby
numbers = [1,2,3,4] # I'm obviously an array
```

Then, once you've created an array, how do you imagine you add to an array?

```ruby
numbers.push 5 # dun, dah nun dun dun dun, push it
# => [1,2,3,4,5]
```

We can also use a "shovel" (`<<`) to push into an array in Ruby. This might be familiar from the similar Terminal command (`echo "node_modules" >> .gitignore`).

```ruby
numbers << "six" 
# => [1,2,3,4,5,"six"]
```

#### Removing From Arrays

Now, it's possible to mix data types in an array. Like JavaScript, Ruby does not care (some languages do).  For now though, let's get rid of the string we just added.

```ruby
numbers.delete "six" # give delete the value you want to get rid of
# => [1,2,3,4,5]
```

#### Useful Array Miscellany

There are so many great array methods - here are a few you'll probably use from time to time.

```ruby
# how many values are there?
numbers.length # => 5, of course

# getting the value at the nth index looks just like you'd expect
# remember, and indexes start at 0!
numbers[3] # => 4

# a handy method equivalent to numbers[0]
numbers.first
# also a handy method equivalent to numbers[numbers.length-1]
numbers.last

# and what if we need to rearrange? so useful!
numbers = [3,2,4,1,5]
numbers.sort # [1,2,3,4,5]
numbers.sort.reverse # => [5, 4, 3, 2, 1]
```

#### You'll be trying this soon, but first – iterating!

Now the good stuff – looping through our array and doing something with each value.

**How did we iterate over an array in JS?** We saw a few options:

```js
// for loop
for (var i = 0; i < numbers.length; i++) {
  console.log(numbers[i]);
};

// js built-in forEach iterator method
numbers.forEach(function(currentValue, currentIndex){
  console.log(currentValue);
})
```


We can do for loops in Ruby, too, but we prefer its built in iterator methods:

```ruby
numbers.each do |number|
  puts "i am number #{number}"  # puts is like a console.log
end

# i am number 1
# i am number 2
# i am number 3
# i am number 4
# i am number 5

```


#### Extra Detail: Dem Blocks Tho!

That `do`/`end` thing you're messing with is called a _block_, and it just runs the code in between, almost like a little function without a name - like anonymous functions in JavaScript.

You'll see blocks all the time, and you'll use `.each` like it's your job. It just loops through each value in your array and assigns a local variable (that you decide) to each object. You come up with what you want it called in the "pipes", aka those tall neighbors surrounding the variable: `|a_variable_of_my_choosing|`.

To make it super clear: if `numbers` is a variable holding `[1,2,3,4,5]`, then `numbers.each` will go through each number and do _something_ to each variable. It's sort of as if the code is doing this:

```ruby
# numbers.each do |number|
#   puts "i am number #{number}"
# end

number = 1
puts "i am number #{number}"

number = 2
puts "i am number #{number}"

number = 3
puts "i am number #{number}"

number = 4
puts "i am number #{number}"

number = 5
puts "i am number #{number}"
```


Of course, the beauty of loops is that we don't have to write all that out.

Oh, and for best practice, always try to make the name of `|a_variable_of_my_choosing|` the singular version of the array you're iterating over: ```numbers.each do |number|``` or ```articles.each do |article|```


And a bonus tip: `do`/`end` is functionally the same as `{`/`}`, so you'll see both. The curly braces are used less often in Ruby blocks - they're for when you want to keep the block on one line.

```ruby
# totally the same
numbers.each do |number|
  puts "i am number #{number}"
end

# totally the same
numbers.each {|number| puts "i am number #{number}"}
```

## Arrays - Independent Practice (10 minutes)

Alright, practice time. 

- Given the following list of student names, **iterate over them**, **prepending** "A+ " if their name includes an "A" in it. Make a new array if you need to
- Then, **sort the students** so that A+ students come first
- Next, **select just the students with A+** in their names. Look it up in the Ruby docs if you need to.
- Finally, **count how many A+ students you have**

```ruby
students = ['Suzy', 'Daniel', 'James', 'Mary', 'Phillip', 'Siegfried']
```

## You're Ready to Move On to Hashes (20 mins)

We use hashes constantly in Ruby. Hashes, like JS objects, are a great way to store related data of all different kinds, in a way that's super readable.

The key to hashes is that they always house key/value pairs. **The key describes the properties, the value is the information relating to or describing the property.**

#### Creating a Hash

To see it in action, let's try to describe a ceiling fan. 

> **Note:** just to prove hashes can hold all kinds of great data, let's see how many different data types we can describe our object with!


```ruby
fan = {
  type: 'ceiling',
  blades: 5,
  speeds: ['low', 'medium', 'high'],
  rotating: true,
  width: {
    measurement: 100.4,
    unit: 'cm'
  }
}
```

Nice! Good work.

Now, based on what you know about how JS objects work, how would you guess we grab data out of here? Let's say we want to know how many blades it has.

```ruby
fan[:blades] # => 5
```

#### Symbols Are For Memory

> _"Hold up, what's the colon above? In JavaScript, we'd use `fan['blades']`, why does that not work?"_ 

Well, young padawans, that's because our keys in Ruby hashes will usually be symbols, wheras in JavaScript objects they were always strings.

Symbols are basically just like strings, except they save computer memory.  Every string you create is unique and takes up space on your computer, even if they're the same value! Symbols are created just once, and any other mention of a symbol with the same value is talking about the same symbol in memory.  The tradeoff is that symbols are never automatically removed from memory ("garbage collected"). 

Let's watch:

```ruby
"Your Name".object_id
#=> a number

"Your Name".object_id
#=> a different number

:your_name.object_id
#=> a number

:your_name.object_id
#=> the same number!
```

Symbols on their own don't do much, but they work great as keys. There are two ways to write them:
```ruby
{
  # original way, still totally works
  :the_original_way => 'some value',
  'a string key' => 'some value',

  # from newer ruby versions
  # shorter, but only allows symbol keys
  the_new_way: 'some value'
}
```

Either are fine; you'll see both a lot. Use the "new way" one if you want your keys to be symbols (and usually you do!)

#### Adding to our hash

Real quick – what if we forgot a key/value pair, or want to add one in after the fact?

```ruby
fan[:color] = 'silver'

# fan = {
#  type: 'ceiling',
#  blades: 5,
#  speeds: ['low', 'medium', 'high'],
#  rotating: true,
#  width: {
#    measurement: 100.4,
#    unit: 'cm'
#  },
#   color: 'silver'
# }
```

#### Guess how to get rid of a key/value pair?

Given we just learned to do this with arrays, it's okay to be unsurprised.

```ruby
fan.delete :color
# remember, parentheses are optional in Ruby!
```

## Hashes - Independent Practice (10 minutes)

Now you try it!

- By hand (not in code yet), describe your computer as a hash. Use any data types you can think of; hash values can be anything!
- When you're done, open your computer, and write it out in IRB. Try getting each key out of your hash, adding in new ones, and deleting ones just for fun.
- In your hashes, try to:
  - Include one key value with the value as an array 
  - Include one key value with the value as another hash (look to the fan hash from earlier!)

## Test Yourself

- How do you get the 4th item of an array?
- How do you get a value out of a hash?
- How do you add a value to a hash? What about an array?
