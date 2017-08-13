require_relative '../lib/menu.rb'

ERROR = "Incorrect price entered"

class Order
  attr_reader :basket

  def initialize(dish = nil, quant = nil, price = nil)
    @basket = [dish, quant, price]
    @current_menu = Menu.new.current_menu
  end

  def process_order
    raise ERROR if !price_correct?
    "Order completed, a text is on its way"
  end

  private

  def price_correct?
    (@current_menu[@basket[0]] * @basket[1]) == @basket[2]
  end
end
