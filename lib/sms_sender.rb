class SMSSender
  def initialize(client, sid, token)
    @client = client.new(sid, token)
  end

  def send(from, to, body)
    @client.messages.create(from: from, to: to, body: body)
  end
end