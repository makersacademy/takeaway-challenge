module FakeSms
  Message = Struct.new(:num, :msg, :app)
  @messages = []

  def self.send_sms(num, msg, app)
    @messages << Message.new(num, msg, app)
  end

  def self.messages
    @messges
  end
end
