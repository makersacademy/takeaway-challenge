 
class Takeaway
  require_relative './menu.rb'
  require_relative './order.rb'
  require_relative './sms_sender.rb'

  attr_reader :menu, :order
  
  def initialize(menu = Menu.new, order = Order.new, sms_sender = SMSSender.new)
    @menu = menu
    @order = order
    @sms_sender = sms_sender
  end
  
  # to get rid of walls of text on 'self' - see readme
  # def inspect
  #   "Takeaway"
  # end

  def read_menu
    @menu.show_menu
  end  

  def order_item(name, quantity = 1)
    item = @menu.find_item(name)
    previous_quantity = @order.basket[item] || 0
    @order.basket[item] = previous_quantity + quantity
  end

  def show_order_basket
    @order.show_basket
  end

  def show_order_total
    @order.calculate_total_price
  end

  def show_order_subtotals
    @order.calculate_subtotals  
  end

  def checkout(total = nil)
                            # if !total.nil? && total != @order.calculate_total
                            # DeMorgan
    fail 'Totals do not match!' unless total.nil? ||
      total == @order.calculate_total
    @sms_sender.send_order_confirmation(@order.calculate_total)
    @order.wipe
  end

end
