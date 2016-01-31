require 'rubygems'
require 'twilio-ruby'
require 'dotenv'

class Notification

  def initialize
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  end

  def send_sms(message)
    client.account.messages.create(
      :from => ENV['TWILIO_PHONE'],
      :to => ENV['TWILIO_DESTINATION_PHONE'],
      :body => message
      )
  end

  private

  attr_reader :client
end