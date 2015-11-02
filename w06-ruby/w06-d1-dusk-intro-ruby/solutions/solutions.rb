# Basic Solution to Exercise 1
def p_times(statement,num)
  i = 0
  while i < num do
    puts statement
    i += 1
  end
end

# A spiffy way to do it
def p_times2(statement,num)
  num.times do
    puts statement
  end
end

# p_times('hello',5)

# Solution to Exercise 2
def letter_count string
  frequency = {}
  i = 0
  while i < string.length do
    if !frequency[string[i]]
      frequency[string[i]] = 1
    else
      frequency[string[i]] += 1
    end
    i += 1
  end
  frequency
end

# Fancier solution to Exercise 2 using .each_char
def letter_count string
	frequency = {}
	string.each_char do |char|
		if frequency[char]
			frequency[char] += 1
		else frequency[char] = 1
		end
	end
	frequency
end

# puts letterCount 'hello'
def mock_me
  while true do
    mock = gets.chomp
    if mock == 'quit'
      break
    else 
      puts mock
    end
  end
end

# mock_me

# Exercise 4
def print_contacts(contacts)
  contacts.each do |k,v,l|
    puts k, v
  end
end

contacts_hash = {'michael' => '555-555-5555', 'del' => '666-666-6666'}
# print_contacts contactsHash

# Exercise 5
def get_contact(contacts)
  puts contacts
  puts 'Name: '
  name = gets.chomp
  puts 'Phone: '
  phone = gets.chomp
  contacts[name] = phone
  contacts
end

# puts get_contact contacts_hash

## List exercises
def get_sum(xs)
  xs.inject do |memo,x|
    memo + x
  end
end

# puts get_sum [1,2,3]

def get_max(xs)
  xs.inject do |memo,x|
    if memo < x
      x
    else
      memo
    end
  end
end

# puts get_max [1,2,5,4,3]

def get_min(xs)
  xs.inject do |memo,x|
    if memo < x
      memo
    else
      x
    end
  end
end

# puts get_min [1,2,-2,5,4,3]

def reverse_str(str)
  str.chars.inject do |memo, x|
    x + memo
  end
end

# puts reverse_str "hello world"

def partial_sums(arr)
  sums = [0]
 arr.inject(0) do |memo,x|
    sums.push(memo+x)
    memo+x
  end
 sums
end

# p partial_sums [1,2,3]

def multiply_by(num,arr)
  arr.map do |x|
    x * num
  end
end

def reverse_each(arr)
  arr.map do |x|
    reverse_str x
  end
end

# p reverse_each ['hello','world','michael']

def get_responses(arr)
  arr.map do |x|
    puts x
    gets.chomp
  end
end

# p get_responses ['what','the','fuck']

def factorial(n)
  if n < 2
    1
  else
    n * factorial(n-1)
  end
end

# puts factorial 4
