## Ruby Method Exercises

1. Make a folder called ruby-methods to keep all these Ruby scripts we're about to write!

2. In a new file, write a method called `full_name` that takes in two arguments: `first` and `last` and returns a concatenated full name string.

  **Challenge Set 1: Primes**

1. Write an `is_prime?` method to check if a number is prime. A prime number is:
  * greater than 1
  * evenly divisible by 1
  * evenly divisible by itself
  * not evenly divisible by any other numbers between 1 and itself

1. Write a method that takes in a number and returns a list of **all** prime numbers less than the given number.

   **Challenge Set 2: Command Line Interaction**

1. Write a method called `get_contact` that

  * takes in a `contacts` hash as a parameter, where the keys in `contacts` are names and the values are phone numbers,
  * prompts the terminal for a **new** `name` and a `phone` number,
  * and then adds the `name` and `phone` as a key value pair respectively **only if** `name` is not already a contact name,
  * and `return`s the updated `contacts` hash.
  
   A sample contacts hash you could use to test would be `sample = {"Bob"=> 4152890045, "Emergency"=> 911, "Jenny"=> 8675309}`.

1. Using `Array#map`, write a method called `get_responses` that takes an array of questions (strings) and returns an array of responses input from the console for each question. (Hint: you will need to use `gets.chomp` and `puts` ).

  **Challenge Set 3: Let's have a HTTParty!**

4. Let's have an [HTTParty](https://github.com/jnunemaker/httparty) -- go ahead and open the docs!

5. Install the httparty gem with `gem install httparty`.

6. Now require it in a new ruby script file, and use it to make a simple request to an external API you've used before, like giphy or Spotify.

###Stretch

1. Guessing Game

   Create a program that asks the user to guess a number between 1 and 100.  Once the user guesses a number, the program should say higher or lower, or report that the number was correct.  The user should continue to make guesses until the correct number is found.  Also, once the user guesses correctly, the program should print the number of guesses needed to arrive at the correct answer. Below is sample output:

   ```
   Guess a number between 1 and 100
   50
   The number is lower than 50.  Guess again!
   25
   The number is lower than 25.  Guess again!
   13
   The number is higher than 13.  Guess again!
   20
   The number is lower than 20.  Guess again!
   17
   The number is higher than 17.  Guess again!
   18
   The number is higher than 18.  Guess again!
   19
   You got 19 in 7 tries!
   ```

1. Rewrite `factorial` without recursion. For an extra challenge, write a recursive *and* an iterative version of a method that takes in a number `num` and calculate the `num`th [Fibionacci number](https://en.wikipedia.org/wiki/Fibonacci_number).
  ```ruby
  fibb(3)
  => 2
  ```

1. Write a method to `reverse` a string [*in-place*](https://en.wikipedia.org/wiki/In-place_algorithm). You can only use a little extra space - think one extra character's worth.  Do not use iterators; use only a `while` loop and indices.


1. Make your `is_prime?` method more efficient. Three hints on how to proceed are spaced out below. Before implementing each hint, develop a short argument to convince yourself that it works.  

   <br><br><br><br><br>
  * Hint: only check possible divisors up to half the original number
   <br><br><br><br><br>
  * Hint: only check possible divisors up to the square root of the original number
    <br><br><br><br><br>
  * Hint: if the number isn't 2, only check whether the number is divisible by odd numbers
