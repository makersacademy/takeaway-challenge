require_relative './user.rb'
# require 'twilio-ruby'

class Text

  attr_accessor :delivery_hour, :delivery_min

  def initialize
    @delivery_hour = 0
    @delivery_min = 0
  end


  def calculating_time
    @delivery_hour = Time.new.hour + 1
    (Time.new.min > 10) ? (@delivery_min = "#{Time.new.min}") : (@delivery_min = "0#{Time.new.min}")
  end

  def text_for_message
    calculating_time
    puts "Thank you! Your order was placed and will be delivered before #{@delivery_hour}:#{@delivery_min} Year: 9906. We hope you enjoy your average at best meal."
  end

  # def twilio_text
  #   account_sid = ACe8f0e2cfb3859b72a08c1ecd6a5f4132
  #   auth_token = a2a9d5b896431ceeef79e94dfee4e33b
  #   @client = Twilio::REST::Client.new account_sid, auth_token
  #   message = @client.messages.create(
  #   body: text_for_message
  #
  # end

end

user = Text.new
user.text_for_message
