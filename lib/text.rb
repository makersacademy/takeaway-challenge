require_relative './user.rb'
# require 'twilio-ruby'

class Text

  attr_accessor :delivery_hour, :delivery_min

  def initialize
    @delivery_hour = 0
    @delivery_min = 0
    @total_amount = User.new
  end


  def calculating_time
    @delivery_hour = Time.new.hour + 1
    (Time.new.min > 10) ? (@delivery_min = "#{Time.new.min}") : (@delivery_min = "0#{Time.new.min}")
  end

  def text_for_message
    calculating_time
    puts "Thank you! Your order was placed and will be delivered before #{@delivery_hour}:#{@delivery_min} Year: 9906. We hope you enjoy your average at best meal."
  end

  def total_price_of_basket
    @total_amount = (@total_amount.order_selection(2, 3)).total_price_of_basket
    return @total_amount
  end

  # def twilio_text_send
  #   account_sid = ACe8f0e2cfb3859b72a08c1ecd6a5f4132
  #   auth_token = a2a9d5b896431ceeef79e94dfee4e33b
  #   @client = Twilio::REST::Client.new account_sid, auth_token
  #   message = @client.messages.create(
  #     body: text_for_message,
  #     to: "+447825148497",
  #     from: "+442030952891")
  # puts message.sid
  # end

end
