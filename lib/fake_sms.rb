module FakeSms
  
  Message = Struct.new(:num, :msg, :app)
  @messages = []

  def self.send_sms(num, msg, app)
    @messages << essage.new(num, msg, app)
  end

  def self.messages
    @messages
  end

end
