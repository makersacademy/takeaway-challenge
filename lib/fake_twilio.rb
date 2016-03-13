class FakeTwilio

  Message = Struct.new(:from, :to, :body)

  def initialize (_account_sid, _auth_token)
  end

  def messages
    self
  end

  def create(from:, to:, body:)
    Message.new(from: from, to: to, body: body)
  end
end
