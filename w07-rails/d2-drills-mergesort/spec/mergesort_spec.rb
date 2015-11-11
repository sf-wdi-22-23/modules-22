require "rspec"
# require "./solution.rb"	
require "./in_class.rb"


RSpec.describe "#merge" do 
	it "handles empty arrays" do
		expect(merge([], [])).to eq []
	end
	it "adds all elements from the first array" do
		expect(merge([8,9,10], [])).to include(8,9,10)
		expect(merge([2,4,6], [1,3])).to include(2,4,6)
		expect(merge([1,2,3], [4])).to include(1,2,3)
	end
	it "adds all elements from the second array" do
		expect(merge([], [80,90,100])).to include(80,90,100)
		expect(merge([10,30], [20,40,60])).to include(20,40,60)
		expect(merge([40], [10,20,30])).to include(10,20,30)
	end
	it "adds repeated elements correctly" do
		expect(merge([0.5, 1.0], [0.5, 1.0])).to eq [0.5, 0.5, 1.0, 1.0]
		expect(merge([:a, :b], [:c, :c])).to eq [:a, :b, :c, :c]
		expect(merge([1,1,1,1,1], [1,1,1])).to eq [1,1,1,1,1,1,1,1]
	end
	it "results in a sorted array" do
		expect(merge([0,3,5,6], [1,2,7])).to eq [0,1,2,3,5,6,7]
	end
end


RSpec.describe "#merge_sort" do 
	it "handles empty arrays" do
		expect(merge_sort([])).to eq []
	end
	it "handles arrays of length 1" do
		expect(merge_sort(["a"])).to eq ["a"]
	end
	it "results in a sorted array" do
		expect(merge_sort([2,4,6,1,3])).to eq [1,2,3,4,6]
		expect(merge_sort([8,9,10])).to eq [8,9,10]
		expect(merge_sort([10,30,20,40,60])).to eq [10,20,30,40,60]
	end
	it "sorts strings" do
		students = [ "Francesca","Laura E.", "Jamey", "Will", "Matt", 
  					 "Uriel", "Brian", "Jennifer", "Sam", "Chris", 
 					 "Josh", "Angelo", "Dani", "Racha", "Riley", 
 					 "Mikey", "Margaux", "Laura B." ]

		fully_reversed = [ "Zain", "Vince", "Scot", "Roy", "Noel", 
  						   "Natasha", "Michael", "Meredith", "Ling", "Jorge",
						   "John", "Jeehye", "Isom", "Eric", "Emily K.", 
  						   "Emily A.", "Brendan", "Breana", "Annie" ]
		expect(merge_sort(students)).to eq students.sort
		expect(merge_sort(fully_reversed)).to eq fully_reversed.sort
	end
end