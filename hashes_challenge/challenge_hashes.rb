person = {name: 'John', height: '2m', weight: '70kgs'}

# Add to the hash: John's occupation (web developer) and hobbies (art).
person.merge!({occupation: "web developer", hobbies: "art"})
# Delete John's weight from the hash
person.delete(:weight)
# Retrieve John's height from the hash
puts person[:height]
# Iterate through the hash so we see John's details.
# person.each do |key,val|
#     puts "#{key} : #{val}"
# end

for key,val in person
    puts "#{key} : #{val}"
end

# computer = {model: 'Think pad', ram: '4GB', clkspd:[10,20,30], os:'windows 10', processor: 'intel i5 pro', app:{office:'ver2010'}}
# puts computer
require 'json'
puts "Enter a customer name:"
name = gets.chomp
items = JSON.parse(File.read('items.json'),:symbolize_names => true)
puts "Press 1 to add items, press 2 to work out a total"
option = gets.chomp
case option
    when '1'
        puts "what would you like to add?"
        food = gets.chomp
        puts "how much does it cost?"
        cost = gets.chomp
        add_item = { customer: name, item: food, cost: cost}
        items.push(add_item)
        File.write('items.json', JSON.dump(items))
    when '2'
        total = 0
        for i in 0...items.length 
            if(items[i][:customer]==name)
                total += (items[i][:cost]).to_f
            end
        end

        # for order in items #teacher's solution
        #     if order[:customer] == name
        #         total += order[:cost]
        #     end
        # end
        puts "#{name} owes $#{'%.2f' %total}"
    else
end



#items[0][:customer]

