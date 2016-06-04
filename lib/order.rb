require_relative "menu"

# Understands how to handle a shopping basket
class Order
  attr_reader :shopping_basket, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @shopping_basket = []
  end

  def reset_order
    @shopping_basket = []
  end

  def add_item(item, quantity = 1)
    quantity.times do
      symbol = item.to_sym
      @shopping_basket << { name: symbol, price: menu.drinks[symbol] }
    end
  end

  def calculate_total
    fail "Empty Basket" if shopping_basket.empty?
    shopping_basket.map do |item|
      item[:price]
    end.reduce(0, :+)
  end
end
