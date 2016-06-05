# require_relative "menu"
require "./data/menu_list"

# Understands how to handle a shopping basket
class Order
  attr_reader :basket, :menu

  def initialize(menu = MENU)
    @menu = menu
    @basket = []
  end

  def update_basket(name, quantity = 1)
    fail "Item not found" unless find_item_price(name)
    quantity.times do
      @basket << name
    end
  end

  def calculate_total
    basket.map do |name|
      find_item_price(name)
    end.reduce(0, :+)
  end

  private

  def find_item_price(name)
    @menu[name.to_sym]
  end

end
