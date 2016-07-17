require_relative 'calculate_bill'
#require_relative 'send_sms'
class Confirmation

  attr_reader :customer_order, :total_value

  def initialize(customer_order, total_value)
    @customer_order = customer_order
    @total_value = total_value
  end

  def prints
    puts "============Customer Confirmation============".center(500)
    @customer_order.each{|dish| puts "#{dish}".center(500)}
    puts "Order Total: £#{@total_value}".center(500)
    send_confirmation
  end

  def send_confirmation
    require_relative 'send_sms'
  end

end
