require 'twilio-ruby'

class TextMessage

  ACCOUND_SID = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ12345'
  AUTH_TOKEN = '54321ZYXWVUTSRQPONMLKJIHGFEDCBA'
  TO_NUMBER = '+xxxxxxxxxxxx'
  FROM_NUMBER = '+yyyyyyyyyyy'
  
  def initialize
    @client = Twilio::REST::Client.new(ACCOUND_SID, AUTH_TOKEN)
  end

  def send_message(total)
    @message = @client.messages.create(
      to: TO_NUMBER,
      from: FROM_NUMBER,
      body: "Your food as been ordered. Thank you for your order. Your order was placed at #{Time.now}. The estimated arrival time is #{Time.now + 60 * 60}. #{total} "
    )
  end
end
