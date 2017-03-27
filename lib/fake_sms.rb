module FakeSms
  Message = Struct.new(:from, :to , :body)
  @messages = []

  # def initialize(_account_sid, _auth_token)
  # end

  def messages
    self
  end

  def create(from:, to:, body:)
    self.class.messages << Message.new(from, to, body)
  end

  attr_reader :messages
end
