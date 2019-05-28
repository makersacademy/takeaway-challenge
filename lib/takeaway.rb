require 'menu'
require 'basket'

class Takeaway
  attr_reader :menu
  attr_reader :basket
  
  def initialize(menu_class = Menu, basket = Basket.new)
    @menu_class = menu_class
    @menu = nil
    @basket = basket
  end

  def view_menu
    @menu = @menu_class.new
    @menu.view
  end

  def select_item(item, quantity)
    pizza = @menu.select_pizza(item)
    @basket.add(pizza, quantity) 
  end

  def view_basket
    @basket.view
  end

  def view_total
    @basket.total
  end
end

# t = Takeaway.new
# t.view_menu
# t.select_item("Neapolitan", 2)
# t.select_item("Margherita", 1)

# puts t.basket.contents
