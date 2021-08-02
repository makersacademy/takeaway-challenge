require_relative 'menu.rb'
class Order
  attr_reader :basket, :menu
  def initialize
    @basket = Hash.new(0)
    @menu = Menu.new

  end

  def view_basket
    @basket
  end

  def add_dish(dish, number)
    # fail "We're out of #{dish}" unless menu.dish?(dish)
    @basket[dish] += number
  end

  def total_order
    total = 0
    @basket.each do |dish, number|
    total += (number * @menu.menu_items[dish])
    end
    "Order total: £#{total}"
  end
end