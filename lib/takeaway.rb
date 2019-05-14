require_relative 'menu'

class Takeaway
  attr_reader :menu
  attr_accessor :order, :quantity

  def initialize(menu = Menu.new)
    @menu = menu
    @order = 0
    @quantity = 0
    @basket = []
  end

  def view_menu
    @menu.prices
  end

  def add_dish(order, quantity = 1)
    quantity.times { @basket << order }
    @order = order
    @quantity = quantity
    basket
  end

  def basket
    "You added #{@quantity}x #{@order}(s) to the basket"
  end

  def total_price
    total = @basket.map { |order| @menu.menu[order] }.inject(:+)
    "The total price for your order is £#{total}"
  end
end
