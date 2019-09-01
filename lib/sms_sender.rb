# frozen_string_literal: true

require 'twilio-ruby'

class SMSSender
  SID = ENV['TWILIO_SID']
  TOKEN = ENV['TWILIO_TOKEN']
  NUMBER = ENV['TWILIO_NUMBER']

  TWILIO_CLIENT = Twilio::REST::Client
  TWILIO_ERROR  = Twilio::REST::TwilioError

  def initialize(client = TWILIO_CLIENT)
    @client = client.new(SID, TOKEN)
  end

  def send_sms(to, body)
    create_message(to, body)
  rescue TWILIO_ERROR => e
    e.message
  end

  private

  def create_message(to, body)
    @client.messages.create(from: NUMBER, to: to, body: body)
  end
end