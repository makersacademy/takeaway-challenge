require 'twilio-ruby'

class TextMessage

  def initialize(client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH']))
    @client = client
  end

  def sms_send(message)
    @client.messages.create(
      :from => ENV['TWILIO_NUMBER'],
      :to => ENV['PHONE_NUMBER'],
      :body => message)
  end

end
