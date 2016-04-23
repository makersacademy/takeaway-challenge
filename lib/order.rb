require_relative 'order_calculator'
require 'twilio-ruby'
class Order

  attr_reader :dishes_ordered

  def initialize(order_calculator: OrderCalculator.new)
    @dishes_ordered = []
    @order_calculator = order_calculator
  end

  def add(dish, quantity)
    @dishes_ordered << {dish: dish, quantity: quantity}
  end

  def check_total(total)
    err = "Unverified order: total does not match order sum. Change payment."
    msg = "Thank you!"\
    " Your order was placed and will be delivered before #{calculate_time}"
    fail err unless verified?(total)
    send_msg(msg)
  end

  private

  def send_msg(msg)
   account_sid = 'AC85db5da11236557f067ad88f4dafdbda'
   auth_token = 'b99770f491a112b5020921347daa2aac'

   @client = Twilio::REST::Client.new account_sid, auth_token
   @client.account.messages.create({
     :from => '+441633530104',
     :to => '+447743106866',
     :body => msg, })
  end

  def calculate_time
    one_hour = Time.now + 60*60
    one_hour.localtime.strftime("%H:%M")
  end

  def verified?(total)
    @order_calculator.verified?(total, @dishes_ordered)
  end

end
