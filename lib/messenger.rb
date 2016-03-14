require 'rubygems'
require 'twilio-ruby'

account_sid = "AC500c5986fef9b566f80bcb84f2c2b8b0"
auth_token = "d66e19cbd27bcb6f10704f56cf0d8e8f"
client = Twilio::REST::Client.new account_sid, auth_token

from = "+441581262036"

class Messager
  def initialize
    @client = Twilio::REST::Client.new "AC500c5986fef9b566f80bcb84f2c2b8b0", "d66e19cbd27bcb6f10704f56cf0d8e8f"
  end

  def send_text(message)
  @client.account.messages.create(
    :from => "+441581262036",
    :to => "+447913835749",
    :body => message
  )
  end

end

message = Messager.new

message.send_text("Kareem")
