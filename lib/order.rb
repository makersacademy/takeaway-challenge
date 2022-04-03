require_relative './confirmation'

class Order
  attr_reader :ordered

  def initialize(basket, confirmation = Confirmation)
    @ordered = basket.basket_contents
    @confirmation = confirmation
  end

  def confirm_order
    @confirmation.new.send_text

  end

end
