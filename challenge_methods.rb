def say(str)
    print str
    print "\n"
end

def add(*numbers)
    # numbers.sum
    puts "I'm about to sum the array #{numbers.inspect}"
    total = numbers.inject(0) { |sum, x| sum += x } #https://www.safaribooksonline.com/library/view/ruby-cookbook/0596523696/ch08s11.html
    return total
end


say('Hello')
say('Welcome to my application!')

puts add(2,5,7)
