require "rubygems"
require "twilio-ruby"


class TwilioAPI

  def initialize( account_sid, auth_token, twilio_phone_number )

    @twilio_phone_number = twilio_phone_number
    @client = Twilio::REST::Client.new(account_sid, auth_token)

  end

  def send_text( customer_phone_number, message )

    @client.account.sms.messages.create(
      :from => @twilio_phone_number,
      :to => customer_phone_number,
      :body => message
    )

  end

end
