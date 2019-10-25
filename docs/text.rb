require "twilio-ruby"
# require "takeaway"

class Text
  #   def initialize
  #     # account_sid = "my account sid"
  #     # auth_token = "my auth token"
  #     # @client = Twilio::REST::Client.new(account_sid, auth_token)
  #     # @from = "+15005550006"
  #     # @to = "+chosen number"
  #     time = Time.new
  #   end

  def message
    # @client.messages.create(
    #   from: @from,
    #   to: @to,
    #   body: "Thank you! Your order was placed and will be delivered before #{time.hour + 1}:#{time.min}",
    # )
    return true
  end
end
