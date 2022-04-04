require './lib/dishes'

test = Dishes.new
# p test

# puts test.list.keys[5]
# puts test.list.values[5]

# puts test.list.key( 5.44 )
# puts test.list.values
# puts test.list.keys

# p test.list.fetch_values("Tuna").join()

p test.check('Tuna')
