class FakeSMS

  Message = Struct.new(:from, :to, :body)

  attr_accessor :messages

  def initialize(sid, token, from, to)
    account_sid = sid 
    auth_token = token
    @from = from # Your Twilio number
    @to = to # Your mobile phone number
    @messages = []
  end

  def send(body)
    p Message.new(
      @from, 
      @to, 
      "Your order is confirmed! It will arrive by #{Time.now + 3600}. Order: #{body}")
  end
end
