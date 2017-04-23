require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

class TextSms

  def send(text='')
    account_sid = 'ACfa9b631a7443203be5289bdefa1522b2'
    auth_token = 'f4d2a8cd599730adcc4a9c4d15f1778d'

       @client = Twilio::REST::Client.new account_sid, auth_token

       @client.account.messages.create(
       :from => ' +33644646817',
       :to => ' +33633774542',
       :body => 'Thank you! Your order was placed and will be delivered before 18:52.',
       )
   end

 end
