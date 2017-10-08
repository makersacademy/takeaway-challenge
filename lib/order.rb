require_relative './menu'


class Order
  attr_reader :basket
  DEFAULT_TOTAL = 0
  
  def initialize(order, total_price = DEFAULT_TOTAL)
    @order = order
    @basket = {}
    @total_price = total_price
  end

  def calculate_total
    @order.each do |item, quantity|
      str = item.to_s + '_x_' + quantity.to_s
      item_total_price = calculate_item_price(item, quantity)
      @basket[str.to_sym] = "£#{item_total_price}"
      @total_price += item_total_price
    end
    complete_basket
  end

private

  def calculate_item_price(item, quantity)
    menu = Menu.new
    menu.price(item) * quantity
  end

  def complete_basket
    @basket[:total] = "£#{@total_price}"
  end

end
