module MockTextMessage
  Message = Struct.new(:number, :msg)
  @messages = []

  def self.send(number)
    msg = "Thank you! Your order was placed and will be delivered before 10:00"
    @messages << Message.new(number, msg)
  end

  def self.messages
    @messages
  end

end
