require 'menu'

class Order

	def initialize
		@dishes = []
		@bill = 0
		@menu = nil
	end

	def select_menu(number)
		#raise ArgumentError, 'Not a valid menu' unless menu.is_a? Menu
		@menu = Menu.select_menu(number)
	end

	def select_dish(name, quantity)
		validate_dish(name.downcase, quantity)
		add_dish(name.downcase, quantity, (find_price(name)*quantity))
	end

	def list_orders
		@dishes.each { |order|
			puts "#{order[:quantity]} #{order[:name]} at #{find_price(order[:name])} each = #{order[:total]}"
		}
	end

	def raise_total
		total_bill
	end

	private

	def total_bill
		total = 0
		@dishes.each {|order| 
			total += order[:total]
		}
		total
	end

	def validate_dish(name, quantity)
		raise ArgumentError, 'No menu selected' if @menu == nil
		raise ArgumentError, 'Not valid dish name' unless dish_exists?(name)
		raise ArgumentError, 'Quantity must be whole number' unless quantity.is_a? Integer
	end

	def dish_exists?(name)
		#return true if valid dish name for menu
		exists = false
		@menu.list_dishes.each { |dish| 
			exists = true if dish[:name] == name.downcase
		}
		exists
	end

	def find_price(name)
		@menu.list_dishes.each { |dish| 
			price = dish[:price] if dish[:name] == name.downcase
		}
		price
	end

	def add_dish(name, quantity, total_price)
		@dishes << {name: name, quantity: quantity, total: total_price}
	end

end
