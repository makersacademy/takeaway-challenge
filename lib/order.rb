require_relative 'menu'

class Order
  attr_reader :total
  def initialize(menu = Menu.new)
    @menu = menu
    @total = 0
    @items = Hash.new(0)
  end

  def customer_order(dish, quantity = 1)
    raise "Sorry! dish not in the menu" unless @menu.read_menu.has_key?(dish)
    @items[dish] += quantity
    @total += price(dish) * quantity
    "#{dish} * #{quantity} added to basket"
  end

  def basket
    basket = []
    @items.each { |dish, quantity|
      basket << "#{dish} * #{quantity} = #{price(dish) * quantity}"
    }
    basket.join(',')
  end

  private

  def price(dish)
    @menu.price_of_dish(dish)
  end
end
