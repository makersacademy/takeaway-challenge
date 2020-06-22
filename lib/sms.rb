class SMS
  def initialize
    sid = ENV["TEST_SID"]
    auth = ENV["TEST_AUTH"]
    @client = Twilio::REST::Client.new(sid, auth)
  end

  def send
    from = "+15005550006"
    to = ENV["TO_PHONE"]
    time = Time.now + 1*60*60
    @client.messages.create(
      from: from,
      to: to,
      body: "Your order has been placed! Expect it by #{time.strftime("%I:%M %p")}"
    )
  end
end