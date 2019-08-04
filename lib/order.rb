require_relative 'restaurant'
require_relative 'menu'
class Order
	ERR_NOT_IN_MENU = "The item is not on the menu"
	attr_reader :dishes, :menu
	def initialize(menu)
		@dishes = {}
		@menu = menu
	end
	
	def add(dish, amount)
		fail ERR_NOT_IN_MENU unless menu.has_dish?(dish)
		dishes[dish] = amount
	end
	
  def total
    item_total.sum
	end

	def item_total
    dishes.map do |dish, amount|
      menu.price(dish) * amount
    end
	end
	
end 