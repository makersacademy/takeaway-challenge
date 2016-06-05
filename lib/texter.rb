require 'twilio-ruby'

class Texter

  account_sid = "{{ ACcbeef6a646d9fd337cc2b72ace78cd50 }}" # Your Account SID from www.twilio.com/console
  auth_token = "{{ c26cea2f00cf3916095fb17bfd2342ec }}"   # Your Auth Token from www.twilio.com/console

  begin
    client = Twilio::REST::Client.new account_sid, auth_token
    client.account.sms.messages.create(
      :from => "+441352860045",
      :to =>   "+447883339743",
      :body => "Hello World"
    )
  rescue Twilio::REST::RequestError => e
      puts e.message
  end
end
