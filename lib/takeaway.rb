require 'twilio-ruby'
require './twilio-keys.rb'

class Takeaway
  attr_reader :order_quantities, :my_total
  LIST = {"mushy peas" => 2, "kebab" => 4, "fish" => 4, "chips" => 3}

  def show_menu
    LIST.each {|food, price| puts "#{food}: #{price} "}
  end

  def take_order(order_quantities, my_total)
    @order_quantities = order_quantities
    @my_total = my_total
  end

  def total
    @sum = 0
    LIST.each{|food, price| @sum += price.to_i * @order_quantities[food].to_i }
    @sum
  end

  def match_total
  raise "Your sum is not correct!" if total != @my_total
  true
  end

  def text
    client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
    time = Time.new
    hour = time.hour
    minute = time.min

    client.account.messages.create(
      :from => MY_TWILIO_NUMBER,
      :to => NUMBER_TO_SEND,
      :body => "Thank you! Your order was placed and will be delivered before #{hour}:#{minute}"
    )
    "Sent message!"
  end

end
