require_relative 'menu'

class Order
  attr_reader :total_price

  def initialize(menu, text_class = Text)
    @total_price = 0
    @menu = menu
    @text_class = text_class
  end

  def add_to_basket(dish_name, quantity = 1)
    positive_int_check(quantity)
    @total_price += item_price(dish_name, quantity)
  end

  def place_order
    check_empty_order
    order_time = Time.now
    @text_class.send_delivery_expected(order_time)
  end

  private

  def check_empty_order
    raise "Can't place empty order" if @total_price.zero?
  end

  def item_price(dish_name, quantity)
    @menu.select_price(dish_name) * quantity
  end

  def positive_int_check(quantity)
    positive_int = quantity.to_int == quantity && quantity.positive?
    raise 'Quantity must be a positive integer' unless positive_int
  end
end
