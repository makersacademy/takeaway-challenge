# frozen_string_literal: true

require 'twilio-ruby'

class SMSSender
  SID = ENV['TWILIO_SID']
  TOKEN = ENV['TWILIO_TOKEN']
  NUMBER = ENV['TWILIO_NUMBER']

  def initialize(client = Twilio::REST::Client)
    @client = client.new(SID, TOKEN)
  end

  def send_sms(to, body)
    create_message(to, body)
  rescue Twilio::REST::TwilioError => e
    e.message
  end

  private

  def create_message(to, body)
    @client.messages.create(from: NUMBER, to: to, body: body)
  end
end