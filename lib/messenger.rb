require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Messenger
  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text
    future_time = Time.now + 3600
    @client.account.messages.create({
    :from => ENV['FROM'],
    :to => ENV['TO'],
    :body => "Thanks! Your order has been placed, and it will be with you by #{future_time.strftime("%H:%M")}"})
    rescue Twilio::REST::RequestError => e
    puts e.message
  end
end
