require 'twilio-ruby'

class Text


  def send_text
    order_time = (Time.new + 3600).strftime("%H:%M")
    account_sid = "AC0fec486c68cb4eb5041930075e919693"
    auth_token = "5f688760630ddbb8e40ab6244c303b77"
    @client = Twilio::REST::Client.new account_sid, auth_token

    sms =  @client.account.messages.create(
      :from => +441732601037,
      :to => +447595299795,
      :body => "Hi, your food will be with you before #{order_time}!"
      )
      puts sms
  end

end
