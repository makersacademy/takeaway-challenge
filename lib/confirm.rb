require 'twilio-ruby'

class Confirm

  def initialize
    @account_sid = "ACd74a5673ab752c473a930fc9c040b23a"
    @auth_token = "c683415b0ae861181feebdc0a87a29a8"
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_text
    time
    @client.messages.create(
      body: "Thank you! Your order was placed and will be " +
      "delivered before #{@h}:#{@m}",
      to: "+447775338549",
      from: "+441225581345")
  end

  private

  def time
    @h = Time.now.hour + 1
    @m = Time.now.min
  end

end
