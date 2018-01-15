require_relative'menu'

class Order
  attr_reader :total

  def initialize(menu = Menu.new)
    @menu = menu
    @total = 0
    @items = Hash.new(0)
  end

  def cust_order(dish, quantity = 1)
    raise "Sorry! that dish is not in the menu" unless @menu.read_menu.has_key?(dish)
    @items[dish] += quantity
    @total += price(dish) * quantity
    "#{dish} * #{quantity} added to basket"
  end

  def basket
    item_strings = []
    @items.each { |dish, quantity|
      item_strings << "#{dish} * #{quantity} = #{price(dish) * quantity}"
    }
    item_strings.join(",")
  end

  def add(dish, quantity = 1)
    cust_order(dish, quantity)
  end

  private

  def price(dish)
    @menu.price_of_dish(dish)
  end
end
