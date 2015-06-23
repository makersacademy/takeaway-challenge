require_relative 'takeaway'

require 'twilio-ruby'

class Texter
  def initialize
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  end
  
  def send
    'message sent'
    @client.account.messages.create({
    :from => '441227641157', 
    :to =>   '+447428121604',
    :body => 'test message'
    })
  end
end




