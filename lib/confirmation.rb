require 'twilio-ruby'

# Confirmation checks the given total and sends SMS if correct
class Confirmation

  attr_reader :given_total, :correct_total

  def initialize(given_total, correct_total)
    @given_total = given_total
    @correct_total = correct_total
  end

  def place_order
    raise 'Incorrect total' unless correct?
    send_message
  end

  def send_message
    account_sid = 'AC4154fafcce0d3c26746b98bd66732eb2'
    auth_token = '274fc9f931688b2473b7d354142d9f4e'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      body: 'Your order has been placed!',
      to: '+447713471715',
      from: '+447403927794')
    'Message sent'
  end

  def correct?
    @given_total == @correct_total
  end

end
