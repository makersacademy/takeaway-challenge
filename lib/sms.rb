require 'dotenv'

Dotenv.load
require_relative 'takeaway'
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

class Sms

  def initialize
  account_sid = ENV['ACCOUNT_SID']
  auth_token = ENV['AUTH_TOKEN']
  @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text(message)
  @client.account.messages.create({
      :from => ENV['FROM_NUMBER'],
      :to => ENV['TO_NUMBER'],
      :body => message
  })
  end
end
