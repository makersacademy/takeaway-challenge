require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class SMS

  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send
    client.messages.create({
      :from => ENV['FROM'],
      :to => ENV['TO'],
      :body => "Thank you! Your order was placed and will be delivered before #{(Time.now.+3600).strftime("%R")}" })
      self
  end

  private
  
  def client
    @client
  end
end
