# given two sorted arrays
# combine all their elements into a new array and return it
def merge arr1, arr2
	output = []
	i1 = 0
	i2 = 0
	while arr1[i1] && arr2[i2]
		if arr1[i1] <= arr2[i2]
			output.push arr1[i1]
			i1 += 1
		else 
			output.push arr2[i2]
			i2 += 1
		end
	end

	# output.concat arr1.slice(i1..-1) if arr1[i1]
	# ^ same answer as while loop below but creates a new array with slice
	while arr1[i1]
		output.push arr1[i1]
		i1 += 1
	end 

	# output.concat arr2.slice(i2..-1) if arr2[i2]
	# ^ same answer as while loop below but creates a new array with slice
	while arr2[i2]
		output.push arr2[i2]
		i2 += 1
	end 
	output
end

# return a new array that contains the input array's elements in sorted order
def merge_sort arr
	if arr.length <= 1
		arr
	else
		mid = arr.length/2
		first_half = arr.slice(0...mid)
		second_half = arr.slice(mid...arr.length)
		merge merge_sort(first_half), merge_sort(second_half)
	end
end