require_relative 'twilio_parameters'
require 'twilio-ruby'

# twilio_parameters.rb should contain the following:
# $account_sid = "...."
# $auth_token = "...."
# $twilio_num = "+441392..."
# $customer_num = "+447540..."

class Sms

  def initialize(text)
    send_sms($twilio_num, $customer_num, text, $account_sid, $auth_token)
  end

  def send_sms(from, to, text, sid, token)
    @client = Twilio::REST::Client.new(sid, token)
    @client.messages.create(body: text, from: from, to: to)
  end

end

class Screen

  def initialize(text)
    puts text
  end

end
