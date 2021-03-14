require 'twilio-ruby'

class Text
  def initialize(client = Twilio::REST::Client.new(
    "ACeb1afeaa145764290dd295ca81c7d9f0", "79e40e410358ccc57e321fda389ee3b0"))
    @client = client
    @account_sid = "ACeb1afeaa145764290dd295ca81c7d9f0"
    @auth_token = "79e40e410358ccc57e321fda389ee3b0"
  end

  def send_message
    @client.messages.create(
      from: "+18186415489",
      to: "+447753410267",
      body: "Thank you! Your order has been placed
      and will be delivered before #{time}")
  end

private

  def time
    time_now = Time.now + (60 * 60)
    time_now.strftime("%I:%M %p")
  end
end
