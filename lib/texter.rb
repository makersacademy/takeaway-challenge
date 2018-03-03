require 'twilio-ruby'

class Texter

  attr_reader :twilio_number, :client

  def initialize
    @account_sid = 'AC0ea6841b22bf58ef98354551ebe33c68'
    @auth_token = '9dbcc6f2ccb3e10a934a716c059803b0'
    @twilio_number = '+447480579431'
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send(number, body)
    @client.api.messages.create(
      from: @twilio_number,
      to: number,
      body: body
    )
  end

  def messages
    @client.api.account.messages.list
  end

end
