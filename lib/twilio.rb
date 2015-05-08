require 'rubygems'
require 'twilio-ruby'

class TwilioSender
 attr_accessor :message

  def initialize
    #set-up ENV Variables?
    @account_sid = 'ACea2ef6a5369b6c039579abf4a411ee36'
    @auth_token = 'c03c2130820bbed08e950482a336f9c8'
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_message
    hour_in_secs = 60*60
    @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{(Time.now+hour_in_secs).asctime}", :to => "+447913251479", :from => "+441442796217")
  end
end