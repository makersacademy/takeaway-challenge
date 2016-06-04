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
		if basket.include? food
			"#{food} is already in the basket. Would you like to add another one? (Yes/No)"
			customer_answer = gets.chomp
			if customer_answer.downcase == "yes"
				basket[food] += amount
				"#{amount} x #{food}(s) added to the basket."
			else
				"Thank you for confirming. #{food} is not added to the basket."
			end
		else
			basket[food] += amount
			"#{amount} x #{food}(s) added to the basket."
		end
	end

end
