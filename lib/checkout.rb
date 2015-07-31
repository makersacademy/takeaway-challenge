require 'twilio-ruby'

class Checkout
  
  def initialize (order)

    @order = order
    @total = nil
    @complete = false

    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH']
    @client = Twilio::REST::Client.new account_sid, auth_token

  end

  def submit

    raise 'your order is empty' if calc_total == 0
    raise 'checkout already complete' if complete

    delivery_time = Time.new + 1800

    message = @client.account.messages.create(
      :body => "Thank you! Your order was placed and will be delivered before #{delivery_time.strftime('%H:%M')}",
      :to => "+447766767031",
      :from => "+441279702199")
    puts message.to

    @total = calc_total
    @order.complete = true
    @complete = true


  end

  private

  attr_accessor :complete

  def calc_total
    @order.view_order.inject(0) {|total,(pizza,values)| total + values[1]}

  end

end
