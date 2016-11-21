
require 'rubygems'
require 'twilio-ruby'
require 'dotenv'

class Sms

  def initialize
    Dotenv.load
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_confirmation
    delivery_time = Time.now + (60 * 60)
    @client.account.messages.create(
    :from => ENV["FROM_NUMBER"],
    :to => ENV["TO_NUMBER"],
    :body => "Thanks for placing your order! Your food will be here before #{delivery_time.strftime('%H:%M')}.")
  end

end
