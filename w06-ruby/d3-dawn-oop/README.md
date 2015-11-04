#Class-based Object Oriented Programming

Ruby <img alt="heart" src="https://em.wattpad.com/6d0355863f6ca950858ed30d2b8b9b1fe982b54c/687474703a2f2f727562792e7a69677a6f2e636f6d2f77702d636f6e74656e742f75706c6f6164732f73697465732f322f323031332f30312f7370696b655f616e645f7261726974795f5f735f68656172745f7368617065645f666972655f727562795f62795f65647761726474656e2e706e67" width="16px">'s Object Oriented Programming

##Learning Objectives

| Objectives: Students will be able to... |
|:--- |
| Distinguish between objects in JS, hashes and objects in Ruby, and classes in Ruby. |
| Create your own class and use the `initialize` method to set up initial behavior. |
| Define attributes and methods for instances, and for the class as a whole. |
| Explain the class-based inheritance pattern with Ruby as an example. |

##Hashes

Recall: Hashes are simple key value stores. They look a lot like JavaScript's objects.

**Hash Example**

```ruby
 ourhash = {name: "Napoleon", fav_food: "steak", skills: ["archery", "combat", "egg farming"]}

 # => {:name=>"Napoleon", :fav_food=>"steak", :skills=>["archery", "combat", "egg farming"]}
```

Recall that there are 2 notations for hashes, a colon (`:`) notation and a hash rocket (`=>`) notation.  The colon notation always results in your keys being symbols, which is usually what we want. The hash rocket notation gives you more control over the types of your keys. 

##Objects

Ruby also has Objects. In fact, everything in Ruby is a BasicObject. However, we almost never use plain vanilla Objects because there are more sophisticated, specialized object types such a `String`, `Integer`, and `Hash`.


**Class Inheritance Tree**

![Class inheritance](http://i.stack.imgur.com/rvcEi.png)


**Example:**
How can we prove that the hash we just created is a `BasicObject`, through `Hash` and `Object`?


```ruby
ourhash.class
# => Hash  

Hash < Object     
# => true

Object < BaseObject
# => true

# or a shortcut:
ourhash.is_a? BasicObject
# => true
```


##Classes

Ruby uses **classes** for object-oriented programming.  Classes are data types used to create more data.  They are similar to the object types we manipulated with constructors and prototypes in JavaScript.  Classes are more common among programming languages than prototypes, so we'll go into more depth about OOP with Ruby than we did with JavaScript. (Also, JavaScript has classes as of its latest version: ECMAScript 6.)

**Challenge:** create a `Monster` class and an instance of `Monster`.

*Hint: you'll have to use the Ruby reserved words `class` and `new`.*


## `initialize`

**Challenge** Update the `Monster` class so that a monster goes "Rawr!" when it's first initialized.

![monster rawr gif](https://s-media-cache-ak0.pinimg.com/originals/8e/dd/5d/8edd5de39a2c832745df9f8dfca15547.jpg)


## Instance Variables 

What should we do if we want to set attributes on the monster, such as its `habitat`?

**Challenge:**
Enable this code...

```ruby
rabbit = Monster.new
# Rawr
rabbit.habitat = "Cave of Caerbannog"
rabbit.habitat
# => "Cave of Caerbannog"
```

*Hint: Use the method `attr_accessor`*

**Challenge:** Add a `threat_levl` instance variable to the Monster class. Allow the user to specify a threat level when the monster is created.

```ruby
dalek = Monster.new(:high)
dalek.threat_level
=> :high
```

**Challenge:** Allow the user to create an instance of `Monster` without specifying a threat level. The default threat level for a new monster should be `:medium`.

```ruby
teletubby = Monster.new
teletubby.threat_level
=> :medium
```

##Instance Methods

**Challenge:** Create a `habitat?` instance method for `Monster` that tests whether the monster's habitat matches what is passed in.

```ruby
yeti = Monster.new
# Rawr!
yeti.habitat = "tundra"
yeti.habitat?("swamp")
# => false
yeti.habitat?("tundra")
# => true
```

*Hint: use `def` to define a new method inside the class*

##Class Variables and Class Methods

What if I wanted a running count of all the Monsters ever created?  Let's keep track with a class variable and print a message each time a new monster spawns.

**Challenge:** Enable this code...

```ruby
predator = Monster.new(:high)
# Rawr!
# 2 monsters now roam the world!

alien = Monster.new(:high)
# Rawr!
# 3 monsters now roam the world!
```

*Hint: Create a class variable with `@@`*

**Challenge:** Create a class method to get the current value of the monster count.

```ruby
Monster.count
# => 3
```

*Hint: Use the reserved word `self`*

**Note** Class variables are used much less often than instance variables!

**Stretch Challenge:** Add a check so that the allowed `threat_level` values at creation are`:low`, `:medium`, `:high`, or `:midnight`.   If another value is passed in as the initial threat_level, `raise` a runtime error.

```ruby
rubber_ducky = Monster.new(:friendly)
# /monster_stretch.rb:31:in `initialize': cannot create monster - invalid threat level friendly (RuntimeError)
#  from manual_test.rb:99:in `new'
#  from manual_test.rb:99:in `<main>'
```

**Stretch Challenge:** Create a class constant called `THREAT_LEVELS` that is an array containing all the allowed values of `threat_level`. 

*Hint: Access the class constant with `Monster::THREAT_LEVELS`.*

*Hint: Use `freeze` to make sure the value of `THREAT_LEVELS` isn't changed later.*

**Challenge:** Create a `fight` class method for `Monster` that takes in two monster instances and compares their  `threat_level`s. The `fight` method should return the monster that has the higher threat level. If they're tied, let the second monster win.

**Stretch Challenge:** Refactor `fight` to use `index` to with `THREAT_LEVELS` to make `fight` code shorter and simpler.

**Stretch Challenge:** Include <a href="http://ruby-doc.org/core-2.2.3/Comparable.html" target="_blank">the `Comparable` mixin</a> in your `Monster` class and create a custom `<=>` method to compare monsters based on their threat levels. Refactor `fight` to use this comparison.

**Compassion Challenge:** Give your `Monster` class a `name` instance variable with a getter and a setter.

*Hint: only modify `initialize` as a stretch (solution not provided). If you modify `initialize` so it takes a `name` argument, update the tests to give each monster instance a name.  Wondering how you could make the `name` argument optional like `threat_level`? Look up Ruby's "keyword arguments" syntax.*


<img alt="monster" src="http://blog.spoongraphics.co.uk/wp-content/uploads/2009/furry-monster/monster.jpg" width=300px>

## Quick Review

  * What is a class?
    - What is an attribute?
    - What is a method?
  * What is the difference between:
    - an instance variable
    - a class variable
  * What is the difference between:
    - an instance mthod
    - a class method
  * Why do we use classes?
  * What is inheritance?

## Inheritance

**Challenge:** Given a `Monster` class that contains a method `get_dangerous` & attribute `threat_level`...

```ruby
class Monster
  attr_accessor :threat_level
  def initialize(threat_level)
  	@threat_level = threat_level
  end
  
  def get_dangerous
    # ruby version of a switch statment is case
    case @threat_level
      when :low
        @threat_level = :medium
      when :medium
        @threat_level = :high
      when :high
        @threat_level = :midnight
      when :midnight
        :midnight
    end
  end
end
```

... let's make a `Werewolf` class and `Zombie` class that inherit from it.

**Challenge:** Create a `Zombie` class that inherits from the base `Monster` class. Set it up so that all zombies (instances) start with a habitat of `"graveyard"`. Enable this code:

```ruby
rob = Zombie.new
puts rob.habitat
# "graveyard"
puts rob.threat_level
# :medium
rob.name = "Rob Zombie"
puts rob.name
# "Rob Zombie"
```

**Challenge:** Create a `Werewolf` class that inherits from the base `Monster` class.  Give werewolves a default initial threat level of `:low`. Enable this code:

```ruby
teen_wolf = Werewolf.new
puts teen_wolf.threat_level
# :low
```

**Challenge:** During a full moon, a werewolf's threat level jumps all the way up to `:midnight`. Write an `update_threat_level` method for `Werewolf` that calculates a werewolf's threat level based on a boolean parameter `full_moon`. The `update_threat_level` method should update the werewolf's `@threat_level` and return its new value.

**Challenge:** Use the class instance variable pattern to add a  `class_description` variable to the `Monster` class. The Monster class description should be `"A scary monster!"`.

*Hint: Create an instance variable (`@class_description`) inside the Monster class, then create a class method getter for it.

**Challenge:** Give `Zombie` and `Werewolf` their own class descriptions.

**Stretch Challenge:** Modify `get_dangerous` to use your `THREAT_LEVEL` class constant.

## Modules

Ruby <a href="http://ruby-doc.org/core-2.2.0/Module.html" target="_blank">`Module`</a>s group together related information (attributes and methods).  They're like simplified classes that can't have instances and don't have inheritance. Rubyists often use them for:
  * "namespacing": encapsulation or bundling of related content, 
  * "mixins": extra methods that can be added into classes without influencing the inheritance tree

**Challenge:** Using the `module` reserved word, create a `Flying` module. Inside the module, define a method `fly` that `puts` a message saying `"it soars across the sky"`. 

**Challenge:** Create a very simple `Vampire` class that inherits from the `Monster` class. Remember to give this new subclass its own `@class_description`.

**Challenge:** Enable the following code:

```ruby
vamp = Vampire.new
vamp.fly
# it soars through the air
```

*Hint: `include` the `Flying` module in the `Vampire` class.*

**Challenge:** Enable the following code:

```ruby
dracula = Vampire.new(:high)
dracula.name = "Count Dracula"
dracula.fly  
# Count Dracula soars through the air
```

*Hint: when included in a class, modules can access instance variables with `self`. For example: `self.threat_level`.*

This module example may not seem great alone, but you can reuse the same `Flying` module to add a fly method to a `Bird` subclass of `Animal`, a `Plane` subclass of `Vehicle`, or a `SuperHero` class. Many of Ruby's powerful built-in modules (like `Comparable`) are used as "mixins" this way.  Modules help keep code DRY and organized.
