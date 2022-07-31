require_relative 'menu'

class Order

  attr_reader :selection, :menu

  def initialize
    @selection = Hash.new(0)
    @menu = Menu.new
  end

  def add_order(dish, quantity)
    @selection[dish] += quantity
  end

  def total
    order_total = 0
    @selection.each do |dish, quantity|
      order_total += (quantity * @menu.dishes[dish])
    end
    "Total cost: #{order_total}"
  end
end
