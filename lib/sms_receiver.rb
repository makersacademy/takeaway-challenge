require_relative "twilio_client.rb"

class SMSReceiver

  attr_reader :client, :received_messages

  def initialize(twilio_client_class)
    @client = (twilio_client_class || TwilioClient).new.client
    @received_messages = []
  end

  def search_for_orders
    access_messages
  end

  private

  def access_messages
    client.account.messages.list.each do |message|
      puts message.body
      # puts message.date_created
      @received_messages << message.body if DateTime.parse(message.date_created).to_time > date_filter
      # puts DateTime.parse(message.date_created).to_time
    end
    p received_messages
    # p DateTime.now.to_time - 3000
  end

  def date_filter
    Time.now - 3000
  end

  # def message_filter
  #   @received_messsages << message if message
  # end

end
