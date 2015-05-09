require 'rubygems'
require 'twilio-ruby'

class Message

  attr_accessor :message

  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send
    hour_in_secs = 60 * 60
    @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{(Time.now + hour_in_secs).asctime}",
      :to => "+447814227163",
      :from => "+441332402819")
  end

end