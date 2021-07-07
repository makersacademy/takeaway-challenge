class SMS
  def initialize(to = ENV["TO_PHONE"])
    sid = ENV["TEST_SID"]
    auth = ENV["TEST_AUTH"]
    
    client = Twilio::REST::Client.new(sid, auth)
    
    from = "+15005550006"
    to = to
    time = Time.now + 1 * 60 * 60
    client.messages.create(
      from: from,
      to: to,
      body: "Your order has been placed! Expect it by #{time.strftime("%I:%M %p")}"
    )
  end
end
