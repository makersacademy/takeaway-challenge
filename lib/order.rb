require_relative 'menu'
require_relative 'takeaway'

class Order

  attr_accessor :current_order
  attr_reader :menu, :total, :receipt

	def initialize(menu = Menu.new)
		@select = {}
		@current_order = []
		@receipt = []
		@total = 0
		@menu = menu
	end

	def add(dish, quant)
    @select = { dish.to_sym => quant }
    @current_order << @select
	end

	def price_calc
		@current_order.each do |item|
			item.each do |dish, quant|
				@cost = menu.avail_dishes[dish] * quant
				@receipt << @cost
			end
		end
	end

  def total
  	price_calc
    @total = @receipt.inject(0){|sum,x| sum + x }
  end

  def basket
  	puts "Your order is as follows: "
  	puts ""
  	@current_order.each do |item|
  		item.each do |dish, quant| 
  			puts "#{dish}, X #{quant} "
  		end
  	end
  	puts ""
  	puts "Total to pay: £#{@total}" 	
  end



end