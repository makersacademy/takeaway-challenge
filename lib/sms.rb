require 'twilio-ruby'
require_relative 'takeaway'

class Sms

  attr_reader :sent

  @account_sid = ENV['TWILIO_ACCOUNT_SID']
  @auth_token = ENV['TWILIO_AUTH_TOKEN']

  def initialize(total)
    @total = total
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @sent = false
  end

  def expected_delivery_time(time) # ewww, whyy??
    mins = time.min + 45
    hours = time.hour
    if mins > 60
      mins = mins - 60
      hours += 1
      mins *= 10 if mins < 10
    end
    hours < 10 ? zero = 0 : zero = ''
    "#{zero.to_s}#{hours}:#{mins}"
  end

  def send
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    @client.account.messages.create(
      from: '+441629690047',
      to: ENV['MY_NUMBER'],
      body: "Thank you for ordering from M.A Sushi. Your order came to a total of £#{@total}0, you can expect your food to be with you by #{expected_delivery_time(Time.now)}."
    )
    @sent = true
  end
end
