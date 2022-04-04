require_relative './confirmation'

class Order
  attr_reader :ordered

  def initialize(basket)
    @ordered = basket.basket_contents
  end

  def confirm_order(confirmation = Confirmation)
    confirmation.new.send_text
  end

end
