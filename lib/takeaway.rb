class TakeAway

  attr_reader :menu, :basket
	
	def initialize(menu)
		@menu = menu
		@basket = {}
	end

	def print_menu
		menu.print_dish
	end

	def place_order(item, quantity=1)
    fail "item not on the menu" unless menu.present? item
    basket[item] = quantity
  end

  def basket_summary
    fail 'Basket is empty' if basket.empty?
    basket.map do |item, qty|
    	format("%s x%d",item,qty)	
    end.join("\n")
  end

  def price(item, qty)
    price = qty * menu.dishes[item].to_f
    format('%.2f', price)
  end

end