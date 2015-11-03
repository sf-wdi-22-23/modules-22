## Guessing Game ##
def guessing_game
	puts "Guess a number between 1 and 100"
	correct = Random.new.rand(1..100)
	num_guesses = 1
	current_guess = gets.chomp.to_i

	while current_guess != correct
		if current_guess > correct 
			puts "The number is lower than #{current_guess}. Guess again"
		elsif current_guess < correct
			puts "The number is higher than #{current_guess}. Guess again"
		end
		current_guess = gets.chomp.to_i
		num_guesses = num_guesses + 1
	end
	puts "You guessed #{correct} in #{num_guesses} tries!"
end

guessing_game
