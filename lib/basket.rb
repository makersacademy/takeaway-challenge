require 'twilio-ruby'
require_relative 'takeaway'

class Basket

  attr_reader :list
  attr_accessor :takeaway

  def initialize
    @list = []
  end

  # def confirm_text
  #   account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
  #   auth_token = 'your_auth_token'
  #   @client = Twilio::REST::Client.new(account_sid, auth_token)
  #
  #   message = @client.messages.create(
  #     from: '+15017122661',
  #     body: 'body',
  #     to: '+447884236309'
  #   )
  #
  #   puts message.sid
  # end

end
