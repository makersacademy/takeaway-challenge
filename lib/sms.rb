require 'twilio-ruby'
require_relative 'takeaway'

class Sms

  @@account_sid = ENV['TWILIO_ACCOUNT_SID']
  @@auth_token = ENV['TWILIO_AUTH_TOKEN']

  def initialize(total)
    @total = total
  end

  def set_time # ewww
    now = Time.now
    min = now.min + 45
    hour = now.hour
    if min > 60
      min = min - 60
      hour += 1
      if min < 10
        min *= 10
      end
    end
    "#{hour}:#{min}"
  end

  def send
    set_time
    @client = Twilio::REST::Client.new @@account_sid, @@auth_token

    @client.account.messages.create(
      from: '+441629690047',
      to: ENV['MY_NUMBER'],
      body: "Thank you for ordering from M.A sushi, Your order came to a total of £#{@total}0, you can expect your food to be with you by #{set_time}."
    )
  end
end
