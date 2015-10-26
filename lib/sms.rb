require 'twilio-ruby'

class SMS

  def send_sms
    account_sid = 'ACc1da6e1d16be551e245c9f8ddd38c6e0'
    auth_token = '{{ f107b8dc11e19f97be280677200d4994 }}'
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
        :body => "Thank you! Your order will be delivered before #{Time.now(+3600)}.",
        :to => "+447711562499",
        :from => "443333440983")
    puts "Message sent"
  end
end

# a = Text.new
# a.send_text
