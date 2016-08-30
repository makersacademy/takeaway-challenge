# describe "User Stories" do
# 	# As a customer
# 	# So that I can check if I want to order something
# 	# I would like to see a list of dishes with prices
# 	it "so I can choose what to order, shows me a menu" do
# 		menu = Menu.new
		
# 		order = Order.new(menu: menu)

# 	end

# # 	As a customer
# # So that I can order the meal I want
# # I would like to be able to select some number of several available dishes
# 	it "so I can create my meal, lets me select a number of dishes" do
# 		menu = Menu.new
# 		dish1 = Dish.new(data: {name: "Burger", price: 10})
# 		dish2 = Dish.new(data: {name: "Chicken", price: 5})
# 		menu.add(dish1)
# 		menu.add(dish2)
# 		menu.read_menu
# 		menu.order(dish1, 2)
# 		menu.order(dish2, 1)
# 		expect(menu.basket_summary).not_to be_empty
# 	end

# end