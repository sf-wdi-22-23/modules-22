## Primes ##
def is_prime?(num)
	if num > 1
		(2..(num-1)).each do |i|
  			if num % i == 0
  				return false
  			end
		end
		true
	else
		false
	end
end


# Make your is_prime? method more efficient. 

def is_prime?(num)
  if num > 2 
    if num % 2 == 0
      return false
    end
    i = 3         # start at 3
    maxn = num**(0.5)   # go up to the square root of num
    while i <= maxn
        if num % i === 0
          return false
        end
        i = i+2       # count up by 2 to check only odd numbers
    end
    true
  elsif num == 2    # special case for 2
    true
  else
    false
  end
end

puts is_prime? 17


