
my_string = String.new("abc") #my_string contains "abc"
puts my_string.class
my_symbol = :abc #my_symbol contains :abc
puts my_symbol.class
my_string = my_string.to_sym
puts my_string.class
my_string = my_string.to_s
puts my_string.class
hash1 = { :name => "luke", :address => "Sydney" }
hash2 = { name: "luke", address: "Sydney" }
puts hash1
puts hash2
# same stored data structure

# Multiple Symbols representing same value point to same Object IDs. Symbols used in a Hash to provide Unique identifier. Run these examples in IRB:
# :test.object_id; :test.object_id; :"test".object_id; :"test".object_id
# symbols representing same value share same object ids

# Multiple Strings with reference to same value all have different Object IDs since Strings are Mutable. Run these examples in IRB:
# "test".object_id; "test".object_id; "test".object_id
# Strings representing same value have different object ids

# Write a Hash to a File, and then read it back from the File, 
# parsing it using option symbolize_keys to convert the retrieved Hash Keys from Strings 
# (the way they are stored in the File) back into Symbols:
require 'json'

File.write('data.json', JSON.dump(hash2))

hash_read = (File.read('data.txt'))
hash_read = JSON.parse(File.read('items.json'),:symbolize_names => true)
puts hash_read.class
