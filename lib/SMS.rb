require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class SMS

  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send
    @client.account.messages.create({
      :from => ENV['FROM'],
      :to => ENV['TO'],
      :body => "Thank you! Your order was placed and will be delivered before #{(Time.now.+3600).strftime("%R")}" })
  end

  def read
    @client.account.messages.list({ }).each do |message|
    puts "----"
    puts message.body
  end
end
end
