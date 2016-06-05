require_relative 'menu'
require_relative 'order'
require_relative 'messager'

class Takeaway

	attr_reader :menu

	def initialize
		@menu = Menu.new
		@order = Order.new
	end

	def see_menu
		menu.display
	end

	def checkout
		messager = Messager.new
		messager.send_confirmation
	end

	def order_food(amount = 1, food)
		fail "Unfortunately we do not have #{food}. Please select from the menu." unless menu.display.keys.include?(food.to_sym)
		order.select_food(amount, food)
	end

	def total
		bill = []
		order.basket.each{ |food, amount| bill << menu.display[food.to_sym] * amount}
		@total_bill = bill.inject(0) { |food_cost, total| food_cost + total }
		"The total cost of your basket is £#{@total_bill}."
	end

	def check_total(total_price)
		total_bill == total_price ? order_breakdown(total_price)	: "Calculation error!"
	end

	private

attr_reader :total_bill, :order

  def order_breakdown(total_price)
		string = "You have ordered: "
		order.basket.each {|food, amount| string = string + "#{amount} x #{food}(s) = £#{menu.display[food.to_sym] * amount}\n"}
		string = string + "The total is: £#{total_price}."
	end

end
#
# takeaway2 = Takeaway.new
# takeaway2.order_food(2, "margarita")
# takeaway2.order_food("chips")
# p takeaway2.order.basket
# p takeaway2.total
# p takeaway2.check_total(13)
# takeaway2.checkout
