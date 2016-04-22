require 'rubygems'
require 'twilio-ruby'

class Message

  def initialize
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  end

  def send_text(message)
    @client.messages.create({
      :from => '+441563262047',
      :to => ENV['MY_NUMBER'],
      :body => message
    })
  end

end
