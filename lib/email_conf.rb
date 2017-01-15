require "./lib/restaurant.rb"

class Email_conf

  def send_text(message,number)

    require 'rubygems'
    require 'twilio-ruby'

    account_sid = 'AC1dfd1c02be125fa3d4271a9914827c53'
    auth_token = '036dda70fa6e1c0525399b33635586c4'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '++441133205697',
      :to => number,
      :body => message,
      })

  end




end
