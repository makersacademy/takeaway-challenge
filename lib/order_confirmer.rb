require 'twilio-ruby'

# This class sends the confirmation texts to customers. It calculates the time
# of delivery and sends this in a text.
class OrderConfirmer

  def initialize(text_api: Twilio::REST::Client, time_client: Time)
    @acc_details = { sid: 'ACc6ec57ff4b9822b689c242826363aada',
      token: '46e2b36162050b8ae26ab9e0280c0c1e' }
    @phone_numbers = { from: '+447533006421', to: '+447969668210' }
    @text_client = text_api.new(@acc_details[:sid], @acc_details[:token])
    @time_client = time_client
  end

  def confirm_order
    @text_client.messages.create(
    from: @phone_numbers[:from],
    to: @phone_numbers[:to],
    body: "Thank you! Your order was placed and will be delivered before
    #{delivery_time}"
    )
  end

  private

  def delivery_time
    (@time_client.now + 3600).strftime("%H:%M")
  end

end
