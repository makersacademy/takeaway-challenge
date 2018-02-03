require_relative 'menu'

class Order

  attr_reader :basket, :menu

  def initialize
    @basket = Hash.new(0)
  end

  def add(dish, quantity)
    @menu = Menu.new
    dish_in_menu?(dish)
    @basket[dish] += quantity
    "#{dish} x#{quantity} added to your basket"
  end

  def sub_total
    @basket.map do |dish, quantity|
      "#{dish} x#{quantity} = £#{"%.2f" % (quantity * @menu.dishes[dish])}"
    end.join(", ")
  end

  def total
    order_total = 0
    @basket.each do |dish, quantity|
      order_total += (quantity * @menu.dishes[dish])
    end
    "Total cost: £#{'%.2f' % order_total}"
  end

  private

  def dish_in_menu?(dish)
    fail "This dish is not on the menu" unless @menu.dishes.has_key?(dish)
  end
end
