require "menu"
class Order

  attr_reader :pizza, :menu

  def initialize
    @menu = Menu.new
    @basket = {}
  end

  def add(item, quantity)
    @basket = {item => quantity}
    price(item, quantity)
  end

  private

  def price(item, quantity)
    menu.pizza[item]*quantity
  end

end
