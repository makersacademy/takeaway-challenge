
class Order

attr_reader :basket

def initialize
	@basket = Hash.new(0)
end

	def select_food(amount = 1, food)
		basket.include?(food) ? check_with_customer_to_add_food(amount, food) : add_food_to_basket(amount, food)
	end

private

	def check_with_customer_to_add_food(amount = 1, food)
		puts "#{food.capitalize} is already in the basket. Would you like to add another one? (Yes/No)"
		customer_answer = gets.chomp
		customer_answer.downcase == "yes" ? add_food_to_basket(amount, food) : "Thank you for confirming. #{food.capitalize} is not added to the basket."
	end

	def add_food_to_basket(amount = 1, food)
		basket[food] += amount
		"#{amount} x #{food}(s) added to the basket."
	end


end
