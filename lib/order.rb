require_relative "sms"

class Order

  attr_accessor :total, :selection

  def initialize
    @sms = Sms.new
    @selection = Hash.new(0)
    @total = 0
  end

  def confirm 
    items_ordered
    p "Order complete, your total is £#{@total}"
  end

  def send_sms
    time = Time.new + 1 * 60 * 60 
    text = "Thank you! Your order was placed and will be delivered before #{time.hour}:#{time.min}"
    @sms.__send__(text)
  end 

  def items_ordered
    @selection.each do |k, v|
      puts "#{k}:" + " x#{v}"
    end
  end
  
end
