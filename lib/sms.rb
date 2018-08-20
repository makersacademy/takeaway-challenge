class SMS

  def initialize(client = Twilio::REST::Client.new(accointid and auth token))
    @client = client

  def deliver_sms
    @client.messages.create(info)
  end




  def info
    {
      body: "stuff",
      from:,


      to:
}

  end

  def delivery time
  end




end
