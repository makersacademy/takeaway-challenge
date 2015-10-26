require 'rubygems'
require 'twilio-ruby'

module Messenger
  @client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_token'])

  def self.send_text
    @client.account.messages.create(
      :to => ENV['TWILIO_my_no'],
      :from => ENV['TWILIO_ACC_no'],
      :body =>"Thank you! Your order was placed and will be delivered")
  end
end
