require_relative "menu"

# Understands how to handle a shopping basket
class Order
  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def add_to_order(name, quantity = 1)
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
    @menu.items[name.to_sym]
  end

end
