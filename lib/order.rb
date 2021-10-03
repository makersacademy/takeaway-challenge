class Order
  
  attr_reader :order, :time
  
  def initialize
    @order = []
  end

  def display_order
  end

  def finish_order
  end

  def confirm_order
  end

  def order_confirmation_message
    delivery_time
    puts "Thanks for your order! It will be delivered at approximately #{ @time.strftime("%H:%M") }."
  end

  def delivery_time
    @time = Time.new + 45*60
  end

  def send_text
  end
end
