class Order
  attr_accessor :order_list
  DEFAULT_QUANTITY = 1

  def initialize(menu = Menu.new)
    @order_list = {}
    @menu = menu
  end

  def add(item, quantity = DEFAULT_QUANTITY)
    @order_list.include?(item) ? @order_list[item] += quantity : @order_list[item] = quantity
    "#{quantity} #{item}(s) added to your order"
  end

  def total
    total_price = 0
    @order_list.each do |item, quantity|
      total_price += quantity * @menu.price(item)
    end
    total_price
  end
end
