require 'rubygems'
require 'twilio-ruby'

class Texter

  def self.send_message(message)

    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    our_number = ENV['OUR_NUMBER']
    customer_number = ENV['CUSTOMER_NUMBER']
    @client.account.messages.create({ :from => our_number, :to =>customer_number, :body => message })

  end

end