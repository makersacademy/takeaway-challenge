require 'menu'
require 'dish'

describe Menu do
	
	let (:menu) { menu = Menu.new }
	let (:dish)	{ dish = Dish.new }


	# need to learn how to test the initialize method


	# it 'should initialize with a dish list' do
	# 	expect(@dish_list).to initialize
	# end



	# it 'should return a dish in the list' do 
		
	# 	dish1 = Dish.new("Water", 1)
	# 	expect(menu.dish(dish1)).to eq(<Dish:0x007fcfc2a1dda0 @name="Water", @price=1>)

	# 	# tested in irb but can write the test
	# 	# <Dish:0x007fbd898bb980 @name="Water", @price=1>

	# 	# dish2 = Dish.new("Cheese Sandwich", 1)
	# 	# expect(menu.dish(dish2).to eq(dish2)
	# end



end