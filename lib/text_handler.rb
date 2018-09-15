require 'twilio-ruby'
require 'time'

class TextHandler

  def initialize(text_api: Twilio::REST::Client)
    @account_sid = 'ACc6ec57ff4b9822b689c242826363aada'
    @auth_token = '46e2b36162050b8ae26ab9e0280c0c1e'
    @client = text_api.new(@account_sid, @auth_token)

    @from = '+447533006421'
    @to = '+447969668210'
  end

  def confirm_order
    @client.messages.create(
    from: @from,
    to: @to,
    body: "Thank you! Your order was placed and will be delivered before
    #{delivery_time}"
    )
  end

  private

  def delivery_time
    (Time.now + 3600).strftime("%H:%M")
  end

end
