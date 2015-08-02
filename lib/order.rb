require './lib/menu.rb'


class Order

	attr_accessor :dishes_ordered, :dish_count, :order_total, :menu_items

	def initialize
		@menu_items = {"Dosa" => 4,"Badam Drink" => 3,"Bisebele Bhath" => 2,"Water" => 1}
		@dishes_ordered = {}
		@order_total = 0
		@dish_count = 0
	end	


	def add_items_to_order (dish, quantity)
		fail "Order something on the menu!" unless ((Menu.new).menu_items).has_key? dish
		@dishes_ordered[dish] = quantity
		@dish_count = @dish_count + quantity
		# quantity.times {dishes_ordered << dish}
		# order_total = quantity * price_per_dish
	end


	def sum_order
		#using each causing error. Using map overwriting each time.
		@dishes_ordered.map { |food, number| menu_items[food] * number }.inject(0, :+)
 	end

  def total
  	total = sum_order
  end

  def show_order
  	dishes_ordered.each { |food, quantity| puts "Item: #{food} / Quantity: #{quantity}" }
  end

  

end