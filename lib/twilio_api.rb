require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class TwilioAPI

  def initialize
    @client = Twilio::REST::Client.new(ENV['AUTH_SID'], ENV['AUTH_TOKEN'])
  end

  def send message
    @client.account.messages.create({
      :from => ENV['FROM'],
      :to => ENV['TO'],
      :body => message
      })
  end

end