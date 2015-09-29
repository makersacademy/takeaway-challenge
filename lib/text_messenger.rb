require 'twilio-ruby'

class TextMessenger

  def send_order_text number, order
    @client = Twilio::REST::Client.new twillio_account_sid, twillio_auth_token
    @message = @client.messages.create(
      from: twillio_phone_number.to_s,
      to: number,
      body: "Thank you for your order!\n\n" + order.display_order_on_sms + "\nwill be delivered before "+ delivery_time
    )
    'Text sent!'
  end

  private

  def delivery_time
    (Time.new + 3600).strftime("%H:%M")
  end

  def twillio_account_sid
    ENV[:account_sid]
  end

  def twillio_auth_token
    ENV[:auth_token]
  end

  def twillio_phone_number
    ENV[:phone_number]
  end
end
