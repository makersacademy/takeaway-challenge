class OrderSystem
  attr_reader :menu, :order_list

  def initialize(menu)
    @menu = menu
    @order_list = {}
  end

  def place_order(item, quantity_needed)
    @order_list[item.to_sym] = [quantity_needed, total_price(item, quantity_needed)]
  end

  def total_order
    @total_order = 0
    order_list.each { |item| @total_order += item[1][1] }
    return @total_order
  end
  # private
  def total_price(item, quantity_needed)
    quantity_needed * menu.list[item.to_sym]
  end
end
