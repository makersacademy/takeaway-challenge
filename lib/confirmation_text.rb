require 'twilio-ruby'
require_relative '../private_details.rb'

class ConfirmationText



  def initialize(client: nil, details: Details.new)
    @details = details
    @client = (client || Twilio::REST::Client.new(details.account_sid, details.auth_token))
  end

  def send_text
    @client.messages.create(info)
  end

  private
  attr_reader :client

  def info
    @details.info
  end
end
