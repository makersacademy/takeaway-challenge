require 'twilio-ruby' # we're telling ruby to load the gem

class Messenger
# put your own credentials here, get them at twilio.com
TIME = Time.now+3600

def send_order order
# set up a client to talk to the Twilio REST API

account_sid = 'AC6e9aa41dc9b52269f000cfedba11868d'
auth_token = '2962db4f97bf0d00f3d7824f4b5992a6'
# send an sms
client = Twilio::REST::Client.new account_sid, auth_token
 client.account.sms.messages.create(
  :from => '+441788422744',
  :to => '+447901970100',
  :body => "Thank you! Your order:#{order} was placed and will be delivered before #{TIME}")
  end
end

# m = Messenger.new
# m.send_order "hello"