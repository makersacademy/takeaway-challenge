require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
class SendMessage

  attr_reader :account_sid, :auth_token, :client, :from

  def initialize
    Dotenv.load
    @account_sid = ENV['ACCOUNT_SID']
    @auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @from = ENV['TWILIO_NUM']

  end

  def send
      delivery_time = Time.new + 3600
      self.client.account.messages.create(
      :from => self.from,
      :to => ENV['NUM'],
      :body => "Thank you! Your order was placed and will be delivered before #{delivery_time.strftime("%H:%M")}")
  end

end
