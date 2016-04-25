require 'rubygems'
require 'twilio-ruby'

class Messenger

  def send
    send_message
    body
  end

  private

  FROM = "+441143031281".freeze
  TO = "+447508420659".freeze

    ACCOUNT_SID = "ACd876ef2e031b1244ad45dbdd3b450231".freeze
    AUTH_TOKEN = "b52119878d1bc77173d4aa85117f77f3".freeze

  def body
    "Thankyou"\
    "We have received your order, it will be delived at #{time_hour}"
  end

  def send_message
   client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
   client.account.messages.create(from:FROM, to:TO, body:body)
  end

  def time_hour
   hour = Time.now + 60*60
   hour.localtime.strftime("%H:%M")
  end


end
