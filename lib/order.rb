

class Order

  attr_reader :menu, :order_list

  def initialize(menu)
    @menu = menu
    @order_list = {}
  end

  def place_order(item, quantity)
    @order_list[item.to_sym] = total_price(item, quantity)
  end

 # private

  def total_price(item, quantity)
    quantity * menu.list[item.to_sym]
  end


end
