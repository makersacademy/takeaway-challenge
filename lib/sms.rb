require 'envyable'
require 'twilio-ruby'

class Sms
  def self.send
    Envyable.load('config/env.yml')
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    to_number = ENV['TO_NUMBER']
    from_number = ENV['FROM_NUMBER']

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :to => to_number,
      :from => from_number,
      :body => 'Thank you! Your order was placed and will be delivered before 18:00',
      })
  end
end
