module Menu

	MENU = [ { :number => 1, :item => "Cheese Pizza", :cost => "£5.99" },
		{ :number => 2, :item => "Pepperoni Pizza", :cost => "£6.99" },
		{ :number => 3, :item => "Vegetarian Pizza", :cost => "£6.99" },
		{ :number => 4, :item => "Hawaiian Pizza", :cost => "£6.99" },
		{ :number => 5, :item => "Chicken Burger", :cost => "£3.50" },
		{ :number => 6, :item => "Beef Burger", :cost => "£3.50" },
		{ :number => 7, :item => "Garlic Bread", :cost => "£2.99" },
		{ :number => 8, :item => "Onion Rings", :cost => "£1.99" },
		{ :number => 9, :item => "Fries", :cost => "£1.50" },
		{ :number => 10, :item => "Ice Cream", :cost => "£3.99" } ]

	def view_menu
		MENU
	end

end