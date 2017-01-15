require_relative 'menu'
require_relative 'basket'

class TakeAway

  attr_reader :menu, :basket, :total

def initialize
  @menu = Menu.new
  @basket = Basket.new(@menu.items)
  @total = 0
end

def view_menu
  @menu.view_menu
end

def order(dish, quantity = 1)
  basket.add_item(dish, quantity)
end

def view_basket
  @basket.selected_items
end

def view_total
  @total = @basket.total
end


private

  def state_total
    "The current total of your order is £#{@total}"
  end

end
