require_relative 'send_message'

class SubmitOrder
  def initialize(message_type = SendMessage, test = false)
    @message_type = message_type
    @test = test
  end

  def submit(order)
    valid_order?(order)
    text_confirmation
  end

  private

  def text_confirmation
    messenger = @message_type.new(@test)
    messenger.send
    "Order submitted"
  end

  def valid_order?(order)
    raise if order.empty?
  end
end
