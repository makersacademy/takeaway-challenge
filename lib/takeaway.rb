require_relative "menu"

class Takeaway
  attr_reader :basket, :menu, :order

  def initialize(order = Order.new)
    @basket = order.basket
    @menu = order.menu
    @order = order
  end

  def see_menu
    @menu.each do |item, price|
      puts "#{item}, £#{price}"
    end
  end

  def checkout(amount)
    self.order.checkout(amount)
  end

  def add_to_basket(item, number = 1)
    self.order.add_to_basket(item, number)
  end

  def show_basket
    self.basket
  end

  def show_price
    "£#{self.order.grand_total}"
  end

end
