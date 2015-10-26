require 'twilio-ruby'

class SendSMS

  def initialize(print_summary)
    send_sms(print_summary)
  end

  def send_sms(print_summary)
    account_sid = 'ACeba5862c42059ee7c8df468caf3f12e7'
    auth_token = '42f14be5727d7175cd2fd33bf77964d5'
    delivery_time = (Time.now + 1800).strftime("%H:%M")
    message = "Thank you for your order. It will be with you by #{delivery_time}"
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
	    :from => '+44 7481339735',
	    :to => '+44 7828209565',
      :body => "#{message} #{print_summary}"
    })
  end

end
