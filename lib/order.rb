require_relative "menu"

class Order
  attr_reader :shopping_cart, :menu, :shopping_cart, :total_price, :choice

  def initialize(menu = Menu.new)
    @shopping_cart = []
    @menu = menu
    @total_price = []
    @choice ={}
    @prices
  end


  def select_food(item, quantity)
    @choice = {item.to_sym => quantity}
    add_choice_to_cart
    "#{quantity} #{item} added to the shopping cart"
  end

  def add_choice_to_cart
    @shopping_cart << @choice
  end
end
# take each item from shopping_cart and return its price x quantity
