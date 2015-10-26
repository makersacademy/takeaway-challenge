require_relative 'menu'

class Order
  
  attr_reader :menu, :basket

  def initialize
  	@menu = Menu.new
  	@basket = []
  	@total_amount = 0
  	@dish = nil
  	@quantity = 0
  end

  def add(dish, quantity = 1)
  	@dish = dish.downcase
  	@quantity = quantity
    available_menu ? update_basket : not_update_basket
  end

  def update_basket
  	@basket.delete_if { |e| e[:name] == @dish }
  	@basket << { name: @dish, quantity: @quantity, 
  	  	        price: menu.list_of_dishes[@dish], 
  	  	        accumulated_prize: accumulated_prize }
  end

  def not_update_basket
  	"We don't have it in the menu."
  end

  def available_menu
  	menu.dish_name.include?(@dish)
  end

  def total
  	x = 0
  	@total_amount = @basket.map { |i| x += i[:accumulated_prize] }.pop
  end

  def checkout(money)
  	money == total ? "your order has been placed" : "The amount is not correct"
  end
  

  private

  def accumulated_prize
  	menu.list_of_dishes[@dish] * @quantity
  end

end