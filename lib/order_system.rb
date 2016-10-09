class OrderSystem
  attr_reader :menu, :order_list

  def initialize(menu)
    @menu = menu
    @order_list = {}
  end

  def place_order(item, quantity)
    @order_list[item.to_sym] = [quantity, total_price(item, quantity)]
  end

  def order_total
    @order_total = 0
    order_list.each { |item| @order_total += item[1][1] }
    return @order_total
  end

  private

  def total_price(item, quantity)
    quantity * menu.list[item.to_sym]
  end
end
