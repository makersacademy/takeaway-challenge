require 'order'

class Checkout

  def initialize

  end

  def total_cost(order)
    get_prices(order.in_basket).inject { |sum, price| sum + price }
  end

  def itemised_receipt(order)
    Printer.new.print(order)
  end

  private
  def get_prices(in_basket)
    in_basket.map { |dish| Menu::LIST_OF_DISHES[dish] }
  end

  def create_receipt(order)
    in_basket.each_with_index { |dish, index|}
  end
end
