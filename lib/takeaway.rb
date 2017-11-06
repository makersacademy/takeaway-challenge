require_relative 'sms_service'

class TakeAway

attr_reader :order, :menu

  def initialize
    @order = []
    # TODO convert @menu to array of hashes including quantity
    @menu = [ ['Melanzane alla Parmigiana', 7.99], ['Calzone', 9.20], ['Gazpacho', 4.00], ['Tiramisu', 5.00], ['Affogato', 4.50] ]
    @sms_service = SMSService.new
  end

  def add_to_order(dish)
    @order << dish
  end

  def order_checkout
    order_total = 0
    @order.each { |x| order_total += x[1] }
    confirm_order
    return order_total
  end

# TODO make private method
  def confirm_order
    return @sms_service.send_confirmation
  end
end
