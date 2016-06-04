require_relative 'menu'

class Takeaway

	attr_reader :menu, :basket

	def initialize
		@menu = Menu.new
		@basket = Hash.new(0)
	end

	def see_menu
		menu.list
	end

	def order(amount = 1, food)
		fail "Unfortunately we do not have #{food}. Please select from the menu." unless menu.list.keys.include?(food.to_sym)
		basket.include?(food) ? check_with_customer_to_add_food(amount, food) : add_food_to_basket(amount, food)
	end

	private

	def check_with_customer_to_add_food(amount = 1, food)
		"#{food} is already in the basket. Would you like to add another one? (Yes/No)"
		customer_answer = gets.chomp
		customer_answer.downcase == "yes" ? add_food_to_basket(amount, food) : "Thank you for confirming. #{food} is not added to the basket."
	end

	def add_food_to_basket(amount = 1, food)
		basket[food] += amount
		"#{amount} x #{food}(s) added to the basket."
	end

end
