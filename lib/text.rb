require 'rubygems'
require 'twilio-ruby'

class Text


  def format_order

  end

  def send_text
    account_sid = "AC0fec486c68cb4eb5041930075e919693"
    auth_token = "5f688760630ddbb8e40ab6244c303b77"
    @client = Twilio::REST::Client.new account_sid, auth_token

    sms =  @client.account.messages.create(
      :from => +441732601037,
      :to => +447595299795,
      :body => "Hey you placed your order or whatever"
      )
      puts sms.body
  end

end
