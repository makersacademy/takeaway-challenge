require "twilio-ruby"

class SMS

  def initialize
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def deliver
    @client.messages.create(
    from: phone_number,
    to: "34629075410",
    body: "Thank you! Your order has been submitted and will be delivered!"
    )
  end

  # def message_args
  #   {
  #     from: phone_number,
  #     to: "34629075410",
  #     body: "Thank you! Your order has been submitted and will be delivered!"
  #   }
  # end

  def delivery_time
    (Time.now + 60 * 60).strftime("%H:%M")
  end

  private

  def account_sid
    "AC463c4302fcc6c8a71729cef92f562be0"
  end

  def auth_token
    "87f251f3724f5c16bc6422f52c54b305"
  end

  def phone_number
    "+34518808951"
  end
end
