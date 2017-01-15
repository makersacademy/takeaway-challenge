require_relative "twilio_client.rb"

class SMSReceiver

  attr_reader :client

  def initialize(twilio_client_class)
    @client = (twilio_client_class || TwilioClient).new.client
  end

  def search_for_orders
    access_messages

  end

  private

  def access_messages
    client.account.messages.list.each do |message|
      puts message.body
    end
  end


end
