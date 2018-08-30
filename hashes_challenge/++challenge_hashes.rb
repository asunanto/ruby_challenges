# Create a ruby application that requests the name of a classmate, and displays their birthday and your birthday. 
# Use at least one Hash and one Array in the solution.
require 'date'
require 'zodiac'
puts "Please enter your name?"
name = gets.chomp
birthdates = [{name: "John", birthday: Date.new(2018, 8, 20)},{name:"Andrew",birthday:Date.new(2018, 8, 10)}]

for i in 0...birthdates.length
    if(birthdates[i][:name] == name)
        birthday = birthdates[i][:birthday] 
    end
end
today = DateTime.now
puts today
difference_birthdays = today - birthday
puts difference_birthdays.to_i  

puts birthday.zodiac_sign

# Bonus:

# Display the number of days between your birthdays.
# Create a method to display their star sign based on their birthday.
# Someone's probably already coded this date to star sign functionality - replace your method with a gem
#https://github.com/7even/zodiac