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
  attr_accessor :name, :age, :location, :number_of_walks, :acummulated_dist
  
  def initialize(name,age,location)
     @name = name
     @age = age
     @location = location
     @walk = 0
     @acummulated_dist = 0 
     @walking_location = []
     @walking_distance = []
  end
    
  def walk(location, distance) #Improve the walk method. Accept a location and a distance. e.g. doggo.walk('Brisbane', 20)
    @walk += 1
    @walking_location.push(location)
    @walking_distance.push(distance)
    @acummulated_dist += distance
    @time = Time.now.strftime("%d/%m/%Y %H:%M")
    self
  end

  def walk_display
    puts @time
    puts "i have been for #{@walk} walks"
    puts "walking location: #{@walking_location}, walking distance: #{@walking_distance} m"
  end

  def total_distance
    puts "total distance walked = #{@acummulated_dist} m"
  end
  
end

doggo = Dog.new("Rover",2,"Brisbane")
doggo2 = Dog.new("Koby",1,"LA")
puts doggo.age
puts doggo2.age

 doggo.walk("Brisbane",40)

 doggo.walk_display
 doggo2.walk("LA",60).walk("LA",60).walk("LA",60)
 
 doggo2.walk_display

 doggo.walk_display

 doggo.total_distance
 doggo2.total_distance

# doggo.total_distance
# #sudo apt-get install rubygems
# #https://rubygems.org/gems/geocoder/versions/1.5.0

# require 'geocoder'


# results = Geocoder.search("Brisbane")
# puts results.first.coordinates

