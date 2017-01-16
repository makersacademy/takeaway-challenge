class SMS
  def get_time
    new_time = "#{Time.now.hour+1}:#{'%02d' % Time.now.min}"
    other_new_time = "00:#{Time.now.min}"
    Time.now.hour!=24 ? new_time : other_new_time
  end

  def the_message(client, time)
  client.messages.create(
    to: "+353 86 350 9027",
    from: "+353 86 180 2719",
    body: "Your order has been placed and will arrive at approx. #{time}"
  )
  end

  def send_message
    time = get_time
    client = Twilio::REST::Client.new( "AC3dc8f9d2b8b60c1e6cc4ccbb9ebc83f7","d450981a93efaa355c231db9bcf35c0e")
    the_message(client, time)
  end
end
