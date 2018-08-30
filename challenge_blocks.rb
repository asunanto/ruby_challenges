# Create a method `total` that takes two numbers and returns their sum.

# puts total(4,4) # -> 8 
def total(a,b)
    return (a+b)
end
puts total(4,4)

# Adjust your method so you can yield blocks. I.e. when you're done, the following code should work:

# total(4,4) do |addition_total|
#   puts "Addition total is #{addition}"
# end

def total(a,b)
    yield(a+b)
end

total(4,4) do |addition_total|
    puts "Addition total is #{addition_total}"
end

# Update your method so you can access subtraction_total in your block too. I.e. when you're done, the following code should work:

# total(4,4) do |addition_total, subtraction_total|
#   puts "Addition total is #{addition_total}" # -> 8
#   puts "Subtraction total is #{subtraction_total}" # -> 0
# end

def total(a,b)
    yield(a+b,a-b)
end

total(4,4) do |addition_total, subtraction_total|
  puts "Addition total is #{addition_total}" # -> 8
  puts "Subtraction total is #{subtraction_total}" # -> 0
end




