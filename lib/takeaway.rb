require_relative 'menu'

class Takeaway

	attr_reader :menu, :basket, :total_bill

	def initialize
		@menu = Menu.new
		@basket = Hash.new(0)
	end

	def see_menu
		menu.display
	end

	def order(amount = 1, food)
		fail "Unfortunately we do not have #{food}. Please select from the menu." unless menu.display.keys.include?(food.to_sym)
		basket.include?(food) ? check_with_customer_to_add_food(amount, food) : add_food_to_basket(amount, food)
	end

	def total
		bill = []
		basket.each{ |food, amount| bill << menu.display[food.to_sym] * amount}
		@total_bill = bill.inject(0) { |food_cost, total| food_cost + total }
		"The total cost of your basket is £#{@total_bill}."
	end

	def check_total(total_price)
		if @total_bill == total_price
			string = "You have ordered: "
			basket.each {|food, amount| string = string + "#{amount} x #{food}(s) = £#{menu.display[food.to_sym] * amount}/n"}
			p string = string + "The total is: £#{total_price}."
		else
			"We apologise there has been an error in calculating the total cost."
		end
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

takeaway2 = Takeaway.new
takeaway2.order(2, "margarita")
takeaway2.order(1, "chips")
p takeaway2.basket
p takeaway2.total
takeaway2.check_total(13)
