## Ruby Method Exercises

**Using a Gem**

1. Let's have an [HTTParty](https://github.com/jnunemaker/httparty) -- go ahead and open the docs!

1. Install the httparty gem from your Terminal with `gem install httparty`.

1. Require the gem in a new ruby script file.

1. Referencing the httparty docs and the spotify API docs, create a `spotify_album_search` method. It should use the gem to do an album search on the word "White" to the spotify API. 

1. Update your method to return the response body, parsed as JSON.

1. Update your method to loop through and print the album names from your search.

1. Update your method to optionally take a parameter for the album name.

**Guessing Game**

1. Create a program that runs in the Terminal and asks the user to guess a number between 1 and 100.  Hint: `gets.chomp`.

1. Once the user guesses a number, the program should respond with "higher" or "lower", or report that the number was correct.  The user should continue to make guesses until the correct number is found.  

1. Once the user guesses correctly, the program should print the number of guesses needed to arrive at the correct answer. 

Sample interaction:

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

**Test Primes (popular interview question!)**

1. Write an `is_prime?` method to check if a number is prime. A prime number is:
  * greater than 1
  * evenly divisible by 1
  * evenly divisible by itself
  * not evenly divisible by any other numbers between 1 and itself

1. Make your `is_prime?` method more efficient. Three hints on how to proceed are spaced out below. Before implementing each hint, develop a short argument to convince yourself that it works.  

   <br><br><br><br><br>
  * Hint: only check possible divisors up to half the original number
   <br><br><br><br><br>
  * Hint: only check possible divisors up to the square root of the original number
    <br><br><br><br><br>
  * Hint: if the number isn't 2, only check whether the number is divisible by odd numbers
