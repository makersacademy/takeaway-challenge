require 'twilio-ruby'

class Message_Handler
  attr_reader :message

  def initialize
    @account_sid = ENV['TWILIO_SID']
    @auth_token = ENV['TWILIO_AUTH']
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_order_message
    hour_in_secs = 60*60
    @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{(Time.now+hour_in_secs).asctime}", :to => "+447913251479", :from => "+441442796217")
  end

  def send_delivery_message
    @client.account.messages.create(:body => "Your order was delivered at #{(Time.now).asctime}. Enjoy eating!", :to => "+447913251479", :from => "+441442796217")
  end
end