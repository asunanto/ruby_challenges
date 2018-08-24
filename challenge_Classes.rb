 class Cat
    def initialize(name)
        @cat_name = name
    end
    def speak
        puts "#{@cat_name} says meaow"
    end
end

pixie = Cat.new("pixie")
pixie.speak


class Dog
  attr_accessor :name
  attr_accessor :age
  attr_accessor :location
  attr_accessor :number_of_walks
  @@number_of_walks = 0
  @@acummulated_dist = 0

  def initialize(name,age,location)
     @name = name
     @age = age
     @location = location
  end

  def walk(location, distance) #Improve the walk method. Accept a location and a distance. e.g. doggo.walk('Brisbane', 20)
    @@number_of_walks += 1
    @@walking_location = location
    @@walking_distance = distance
    @@acummulated_dist += distance
    @@time = Time.now.strftime("%d/%m/%Y %H:%M")
    self
  end

  def walk_display
    puts @@time
    puts "i have been for #{@@number_of_walks} walks"
    puts "walking location: #{@@walking_location}, walking distance: #{@@walking_distance} m"
  end

  def total_distance
    puts "total distance walked = #{@@acummulated_dist} m"
  end
  
end

doggo = Dog.new("Rover",2,"Brisbane")
puts doggo.age

# doggo.walk("Brisbane",40)
# doggo.walk("Brisbane",40)
# doggo.walk_display

# doggo.total_distance
# #sudo apt-get install rubygems
# #https://rubygems.org/gems/geocoder/versions/1.5.0

# require 'geocoder'


# results = Geocoder.search("Brisbane")
# puts results.first.coordinates

