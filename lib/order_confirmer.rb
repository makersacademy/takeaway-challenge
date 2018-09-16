require 'twilio-ruby'

class OrderConfirmer

  def initialize(text_api: Twilio::REST::Client, time_client: Time)
    @account_sid = 'ACc6ec57ff4b9822b689c242826363aada'
    @auth_token = '46e2b36162050b8ae26ab9e0280c0c1e'
    @text_client = text_api.new(@account_sid, @auth_token)

    @from = '+447533006421'
    @to = '+447969668210'

    @time_client = time_client
  end

  def confirm_order
    @text_client.messages.create(
    from: @from,
    to: @to,
    body: "Thank you! Your order was placed and will be delivered before
    #{delivery_time}"
    )
  end

  private

  def delivery_time
    (@time_client.now + 3600).strftime("%H:%M")
  end

end
