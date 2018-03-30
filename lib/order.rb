require_relative 'notify_user'

class Order 
  def initialize(order)
    @order = order
  end 
  
  def place_order
     raise StandardError.new('please specify a total') unless set_total
     raise StandardError.new('empty order submited') if empty_order?
     raise StandardError.new('number of dishes does not match total') unless correct_total?
     send_text 
  end

  private
  def set_total
    @total = @order.delete(:total)
  end

  def send_text
    NotifyUser::send_notification
  end

  def empty_order?
    @order.size == 0 
  end

  def correct_total?
    actual_total = @order.values.reduce(:+)
    actual_total == @total
  end
end