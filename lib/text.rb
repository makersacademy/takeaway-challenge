require 'twilio-ruby'
require_relative 'secret_number'

class Text

  attr_reader :from, :to

  def initialize
    $account_sid = SecretNumber::ACCOUNT_ID
    $auth_token = SecretNumber::AUTH
    @client = Twilio::REST::Client.new($account_sid, $auth_token)

    @from = SecretNumber::TWIL_NUM # Your Twilio number
    @to = SecretNumber::NUMBER # Your mobile phone number

    @order = "Thank you! Your order was placed and will be delivered before 18:52"
  end
  
  def confirm_order
    @client.messages.create(
    from: @from,
    to: @to,
    body: @order
    )
  end
end
