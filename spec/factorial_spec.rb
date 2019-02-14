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

# describe Factorial do
#   let(:calculator) { Factorial.new }
#   it "finds the factorial of 5" do  
#     expect(calculator.factorial_of(5)).to eq(120)
#   end
# end

# Now you can reuse calculator in all your tests under the same
# describe block.

# Let is lazy. The object won’t be created until the first time you
# use it.

# This can make a difference if creating this object has side-effects,
# like creating database entries, or writing to a file.

# It would be best to avoid these side-effects, but if you can’t do
# that then use the let! method.

# The let! method is non-lazy, so the object will be created before
# any tests are run.

##################

# Another version of let is subject.

# The only difference is that you can only have one subject, and it’s
# meant to be an instance of the main object you are testing.

# RSpec already creates a default subject like this:

# subject { Factorial.new } This is called the “implicit subject”.

# You can use it like this:

# describe Factorial do   it "finds the factorial of 5" do
# expect(subject.factorial_of(5)).to eq(120)   end end You can give
# your subject a name:

# subject(:calculator) { Factorial.new } This behaves the same way as
# using let, but it enables the use of one-line expectations:

# it { should be_empty }

#################

# RSpec has execution hooks you can use to run something before &
# after every test, or a whole group of tests.

# describe Shop do   
# before(:all) { Shop.prepare_database }   
# after(:all) { Shop.cleanup_database } 
# end

# If you want to run this code for each example (example = test in
# RSpec) you can use :each instead of :all.

################

# If you’re testing different scenarios in your app then it may be
# helpful to group related tests together.

# You can do this using a context block in RSpec.

# Here’s an example:

# describe Course do
#   context "when user is logged in" do
#     it "displays the course lessons" do
#     end
#     it "displays the course description" do
#     end
#   end
#   context "when user it NOT logged in" do
#     it "redirects to login page" do
#     end
#     it "it shows a message" do
#     end
#   end
# end

################

# It’s possible to disable a test for debugging purposes.

# All you have to do is to change it to xit for the tests you want to
# disable.

# xit "eats lots of bacon" do
# end

################

# Instead of disabling tests, you can filter the tests you want to run
# with the -e flag.

# > ruby person.rb -e bacon

################

# expect(calculator.factorial_of(5)).to eq(120)

# Matchers are how RSpec compares the output of your method with your
# expected value.

# In the case of eq, RSpec uses the == operator (read more about Ruby
# operators).

################

# expect(nil).to be_nil 
# Where nil is a predicate method (like empty?)
# that is going to be called on the test results.

# Other useful matchers:

# include (for arrays & hashes)
# start_with
# end_with
# match (for regular expression matching)
# be_between
# have_key / have_value (for hashes)
# be_instance_of
# respond_to
# have_attributes (for testing instance variables)

##############

# A matcher that needs special attention is the raise_error matcher.

# The reason for that is that to use it you have to wrap your
# expectation within a block.

# expect{ :x.count }.to raise_error(NoMethodError)

##############

# The change matcher also works like this:

# expect{ stock.increment }.to change(stock, :value).by(100)

##############

# RSpec Formatters
# The default RSpec output is in the “progress” format.

# With this format you see dots (.) representing 1 passing test each,
# an F for a failed test (expected & actual don’t match), or an E for
# an error.

# But there are alternative formatting options you can use.

# Here’s a list:

# progress
# documentation
# json
# html
# You can enable them with the -f flag:

# > ruby factorial.rb -f d
# Person
#   eats lots of healthy food
#   writes many articles
# Finished in 0.00154 seconds (files took 0.09898 seconds to load)
# 2 examples, 0 failures

# The documentation format uses your test descriptions to generate the
# output.

##############

# RSpec comes with a very handy option to profile your tests.

# Just by passing the --profile flag you’ll be able to see how long
# each test takes to run & fix the really slow ones.

# Here’s an example:

# > ruby factorial.rb --profile
# Factorial finds the factorial of 5
#   0.00043 seconds
