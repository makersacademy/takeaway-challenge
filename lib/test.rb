require './lib/dishes.rb'

test = Dishes.new
# p test

puts test.list.keys[5]
puts test.list.values[5]