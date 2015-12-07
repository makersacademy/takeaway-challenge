require 'sinatra'
require 'twilio-ruby'

class ConfirmOrder

  def initialize
  @account_sid = 'AC4c0b4131495b6b9e2d9eae345fe4d986'
  @auth_token = '1c6f162056679a97d9d690a164a2d866'
  @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

def send_message
@client.account.messages.create({
  :from => '+441915801985',
  :to => '+447783405573',
  :body => "Congratulations! Order successful, it will be delivered before #{Time.new+(60*60)}",
})
end


end
