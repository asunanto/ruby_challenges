four_letter_animals = ['Calf','Duck','Elephant','Goat','Lamb','Lion','Mule','Dog'];
puts four_letter_animals;
puts ""
four_letter_animals.push('Puma')
four_letter_animals.insert(4,'Joey') #Insert Joey after Goat and before Lamb
puts four_letter_animals;
puts ""
four_letter_animals.delete('Dog') #Delete Dog
puts four_letter_animals;
puts ""
four_letter_animals = four_letter_animals.reverse; #reverse the order
puts four_letter_animals;
puts ""
if four_letter_animals.include? 'Elephant'
     four_letter_animals=four_letter_animals.map { |x| x == 'Elephant' ? 'Foal' : x } #replace the element
end
p four_letter_animals
four_letter_animals.push('Bear')
puts four_letter_animals
four_letter_animals = four_letter_animals.reverse; #reverse the order
puts "this is the reversed array"
puts four_letter_animals

puts ""
puts four_letter_animals.length
puts ""
puts four_letter_animals.sort


width = 2
height = 3
array = Array.new(height){Array.new(width)} #=> [[nil, nil], [nil, nil], [nil, nil]] 

for x in 0..2
    puts "What would you like to have?"
    array[x][1]= gets.chomp;
    if (array[x][1]=='ice cream')
        array[x][1]= 'Brocolli'
    end
    puts "How many?"
    array[x][2]= gets.chomp;
    
end


array.each { |x|
 puts x.join(" ")
}

  