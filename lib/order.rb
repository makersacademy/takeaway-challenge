require "./lib/messager.rb"

class Order 
  attr_reader :items

  def initialize(messager = Messager.new)
    @messager = messager
    @items = Array.new
  end

  def checkout(minutes = 60)
    message = "Thank you! Your order was placed and will be delivered before " << time_plus_n_minutes(minutes)
    raise "failed to send sms to customer" if !@messager.send_sms(message)
    message
  end

  def time_plus_n_minutes(minutes)
    t = Time.now.to_i + (minutes * 60)
    Time.at(t).strftime("%H:%M")  
  end

end
