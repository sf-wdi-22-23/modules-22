# NON RECURSIVE

def fibbonacci ammount
	fibbs = [1,1]
	ammount.times do 
		fibbs << fibbs[-1] + fibbs[-2]
	end 
	fibbs
end

p fibbonacci 100


def recursive_fibbonacci ammount, array=[1,1]
	if ammount > 0
		array << array[-1] + array[-2] 
		recursive_fibbonacci ammount - 1, array
	end
	array
end	


p recursive_fibbonacci 100