class FakeSms
    attr_accessor :messages
    @messages =[]

  def self.messages
    @messages
  end

  def self.send_message(msg = "Message sent")
    @messages << msg
  end
end
