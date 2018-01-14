class FakeSms
  attr_accessor :messages
  def initialize
    @messages = []
  end

  def messages
    @messages
  end

  def send_message(msg = "Message sent")
    @messages << msg
  end
end
