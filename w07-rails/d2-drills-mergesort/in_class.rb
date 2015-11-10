def merge_sort array_to_sort
	# if tiny, return immediately
	return array_to_sort if array_to_sort.length <= 1
	# split array in half
	mid = array_to_sort.length/2  # ruby floors it for you!
	arrL = array_to_sort[0,mid] # return array with 0 up to mid-1
	arrR = array_to_sort[mid,array_to_sort.length]
 	# sort each half with mergesort
 	arrL_sorted = merge_sort(arrL)
 	arrR_sorted = merge_sort(arrR)
	# merge them back together
	merge arrL_sorted, arrR_sorted
end

def merge arrayLeft, arrayRight
	output = []
	# compare values from each array (starting with first indices)
	i = 0
	j = 0
	while i < arrayLeft.length && j < arrayRight.length
		# move over the smaller and increase that array's index
		if arrayLeft[i] < arrayRight[j]
			output << arrayLeft[i]
			i += 1
			# could also .shift to remove first element, and check if empty
		else 
			output.push ( arrayRight[j] )
			j += 1	
		end
	end 
	# now, either i = arrayRight.length or j == arrayLeft.length
	# so we're done with one array
	if i == arrayLeft.length  # fishished with left array
		output.concat arrayRight[j, arrayRight.length]
	end
	if j == arrayRight.length  # fishished with right array
		output.concat arrayLeft[i, arrayLeft.length]
	end
end
