require 'rubygems'
require 'twilio-ruby'

module Twilio

  def send_sms(text)

    account_sid = 'AC09d1ffc7c2186ed8636bb5ebeba54483'
    auth_token = 'b87495b0349073ef0171140cdf82c4ee'


    @client = Twilio::REST::Client.new account_sid, auth_token 
    message = @client.account.messages.create(
        :body => text,
        :to => "+447595593385",     
        :from => "+441412803593")

    puts message.sid

  end

end