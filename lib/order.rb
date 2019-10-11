require "menu"
class Order

  attr_reader :selection, :menu, :shopping_cart

  def initialize(menu = Menu.new)
    @selection = {}
    @shopping_cart = []
    @menu = menu
  end

  def select_items(item, quantity)
    @selection = { item.to_sym => quantity }
    add_selection_to_order
    return "#{quantity} x #{item}(s) added to your shopping cart"
  end

  def add_selection_to_order
    @shopping_cart << @selection
  end

end
