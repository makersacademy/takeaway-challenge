# require 'twilio'

class Order
  
  attr_reader :orders, :menu, :time
  
  def initialize
    @orders = []
  end

  def display_order
  end

  def finish_order
  end

  def order_confirmation
    delivery_time
    puts "Thanks for your order! It will be delivered in around 45 minutes at approximately #{ @time.strftime("%H:%M") }."
    # send_sms
  end

  def delivery_time
    @time = Time.new + 45*60
  end

end
