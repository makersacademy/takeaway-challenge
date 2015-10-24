require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

class SendSMS

  def initialize(order_summary, total)
    send_sms(order_summary, total)
  end

  def send_sms(order_summary, total)
    # put your own credentials here
    account_sid = 'AC403eb1e438cc3f5d5512ae76466ab194' #'SECRETKEY'
    auth_token =  'e234744b9f701e4cb1de7a78a1e6ba2e' #'SECRETtwilioKEY'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
    	:from => '+441724410077',
    	:to => '+447943313541',
    	:body => "Your order has been confirmed! It will be delivered by #{(Time.now + 3600).strftime("%H:%M")}\n#{order_summary}\n#{total}",
    })
  end

end
