class Order
  attr_reader :order_list, :total, :menu

  def initialize(menu)
    @order_list = []
    @total = 0
    @eta = nil
    @menu = menu
  end

  def add_to_order(item, number = 1)
    number.times { @order_list << item }
    number.times { @total += look_up_price(item) }
  end

  private
  def look_up_price(item)
    @menu[item]
  end
end
