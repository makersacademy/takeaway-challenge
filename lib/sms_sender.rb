# frozen_string_literal: true

require 'twilio-ruby'

class SMSSender
  def initialize(client = Twilio::REST::Client)
    @client = client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
  end

  def send_sms(to, body)
    create_message(to, body)
  rescue Twilio::REST::TwilioError => e
    e.message
  end

  private

  def create_message(to, body)
    @client.messages.create(from: ENV['TWILIO_NUMBER'], to: to, body: body)
  end
end