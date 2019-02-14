require './Factorial.rb'

# First is the test name, plus a way to group together all the
# components of the test itself.

# The components are:

# Setup Exercise Verify The setup is where you create any objects that
# you need to create.

# It’s the preparation phase.

# Then you call the method you want to exercise to get its return
# value.

# Finally, you verify the result with an expectation (RSpec) or
# assertion (Minitest).


# describe Factorial do
#   it "finds the factorial of 5" do
#     calculator = Factorial.new

#     expect(calculator.factorial_of(5)).to eq(120)
#   end
# end

# If you want to write many tests & reuse the same objects you can
# define these objects with let statements.

describe Factorial do
  let(:calculator) { Factorial.new }
  it "finds the factorial of 5" do  
    expect(calculator.factorial_of(5)).to eq(120)
  end
end
