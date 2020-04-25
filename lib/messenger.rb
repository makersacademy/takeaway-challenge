require 'twilio-ruby'

class Messenger

  attr_reader :client, :account_id, :account_auth, :source_number, :target_number

  def initialize
    @account_id = ENV['TWILIO_AC_ID']
    @account_auth = ENV['TWILIO_AUTH']
    @source_number = ENV['TWILIO_SRC']
    @target_number = ENV['TWILIO_TAR']
    @client = Twilio::REST::Client.new(ENV['TWILIO_AC_ID'], ENV['TWILIO_AUTH'])
  end

  def send_confirmation_message
    @client.messages.creat(from: @source_number, to: @target_number, body: "")
  end
end
