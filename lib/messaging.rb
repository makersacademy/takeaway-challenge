class Messaging
  # repeating myself, consider a class for from/to perhaps?
  attr_accessor :to, :from, :message

  def initialize(message_type, from, to, message)
    @message_type = message_type
    @from = from
    @to = to
    @message = message
  end

  def send
    @message_type.send(@from, @to, @message)
  end

end
