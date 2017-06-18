require './docs/menu.rb'

class Order

attr_accessor :total_basket, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @total_basket = {}
  end

  def add_dish(dish, quantity = 1)
    fail "Item not on the menu!" unless menu.dishes.include?(dish)
    @total_basket.store(dish, quantity)
  end

    def display_total
    p "Your bill comes to £#{calculate_total}"
  end

private
	def calculate_total
    	total = 0
    	@total_basket.each do |k, v|
    	total = total + (v * menu.find_price(k))
    end
    total
  end
end
