# Ruby Methods Practice


| Objectives: Students will be able to... |
|:--- |
| Write methods in Ruby to solve problems. |

## Lesson Structure

In this folder, there are three exercises that challenge you to:
   * use a gem to make an http request (real-world)
   * write a simple number guessing game (logic practice)
   * test whether a number is prime (interview problem)

Also, we have a <a href="" target="_blank">Ruby Methods Drills</a> activity focused on Test-Driven Development (TDD).

Today, we'll:
  * Do the "Using a Gem" exercise from <a href="exercises.md" target="_blank">exercises.md</a>.
  * Do the "Primes" exercise from <a href="exercises.md" target="_blank">exercises.md</a>.
  * Do Ruby Methods Drills!

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

