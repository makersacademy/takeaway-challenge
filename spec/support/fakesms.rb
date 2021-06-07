# rails class attribute accessor is cherry pickable, so requiring it here. 
require 'active_support/core_ext/class/attribute_accessors'

class FakeSMS
  Message = Struct.new(:from, :to, :body)

  cattr_accessor :messages
  self.messages = []

  def initialize(_account_sid, _auth_token)
  end

  def messages
    self
  end

  def create(from:, to:, body:)
    self.class.messages << Message.new(from: from, to: to, body: body)
  end
end
