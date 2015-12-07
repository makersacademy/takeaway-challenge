require 'sinatra'
require 'twilio-ruby'

class ConfirmOrder

  def initialize
    @account_sid = ENV["PHONE_NUMBER"]
    @auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

def send_message
@client.account.messages.create({
  :from => '+441915801985',
  :to => ENV["PHONE_NUMBER"],
  :body => "Congratulations! Order successful, it will be delivered before #{Time.new+(60*60)}",
})
end


end
