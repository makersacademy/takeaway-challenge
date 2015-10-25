require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require './env.rb'


module Message

  include Env

  def send_message
    # put your own credentials here
    account_sid = 'AC02f87785f54ab71ecfbd4fc4602c832a'
    auth_token = self.authorization_token

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '+447983604913',
      :to => self.customer,
      :body => self.submit_order
    })
  end

end
