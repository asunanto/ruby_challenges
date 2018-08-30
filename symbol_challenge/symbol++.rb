require 'benchmark'
# Write a Ruby program for each of the following statements that proves whether or not the 
# statement is actually true or not. 
# Resources that may help you achieve a solution include the Ruby Benchmark Module
# Symbols are faster than Strings for comparisons since they are comparing object_ids
# Symbols are not cleaned up by garbage collector (GC) heap memory management until the end of runtime,
# so declaring many symbols may waste memory
# n = 5000000
# Benchmark.bm(7) do |x|
#   x.report("for:")   { for i in 1..n; "a"; end }
#   x.report("times:") { n.times do   ;  "a"; end }
#   x.report("upto:")  { 1.upto(n) do ;  "a"; end }
# end

# Benchmark.bm(7) do |x|
#     x.report("for:")   { for i in 1..n; :a; end }
#     x.report("times:") { n.times do   ;  :a; end }
#     x.report("upto:")  { 1.upto(n) do ;  :a; end }
#   end

# Find out whether Strings provide more methods for String manipulation than Symbols. Hint: Symbol.methods.length, String.methods.length
puts Symbol.methods.length
puts String.methods.length


# Write a Ruby program that demonstrates whether Symbols or Strings are easier to deal with to maintain a 
# DRY codebase
puts "hello world".object_id #returns a number of object id
puts "hello world".object_id #occupies less in heap memory
puts "hello world".object_id
puts "hello world".object_id
puts "hello world".object_id
puts :"hello world".object_id #returns only a single object id
puts :"hello world".object_id
puts :"hello world".object_id
puts :"hello world".object_id
puts :"hello world".object_id


# Given the statement: "Strings may be frozen to be less mutable like Symbols". 
# Answer to the following questions:
# What is the definition of "immutable"?
# immutable objects can't be changed, it can only be overwritten 


# Write a Ruby program to prove whether the above statement is true or false.
puts "hello" << " world"
#puts :hello << :" world"  #can't execute code

# Example:
test = "test"; 
test.upcase!; 
puts test; 
test.freeze; 
puts test.frozen?; 
#test.upcase!; #code


# Write a real-world Ruby program that meaningfully uses the freeze method
CONST_IP_ADDRESS = "61.69.57.138"
CONST_IP_ADDRESS.freeze
#lets us say that we want to declare constants, we use freeze!

# Write a Ruby utility program that overwrites the in-built Ruby Object class to include an unfreeze 
# instance method. Implement this unfreeze method in your real-world Ruby program that already uses the
# Ruby in-built freeze method.
# Example:
require 'fiddle';
class Object; 
    def unfreeze; 
        Fiddle::Pointer.new(object_id * 2)[1] &= ~(1 << 3); 
    end; 
end
test = "test";
test.upcase!;
puts test;
test.freeze;
puts test.frozen?;
#test.upcase!; #can't execute
test.unfreeze;
test.upcase!
puts test

