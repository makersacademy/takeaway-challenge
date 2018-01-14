class Takeaway
  attr_reader :menu, :order, :sms

  def initialize(menu:, order: nil, sms: nil)
    @menu = menu
    @order = order
    @sms = sms
  end

  def show_menu
    menu.printing
  end

  def order_placed(dishes_prices)
    dishes_prices.each {|name, qty| order.add(name, qty) }
    sms.delivered
    order.total_amount
  end

end
