require_relative 'verify_order'

class Order

  attr_reader :basket

  def initialize(verify_order = VerifyOrder.new)
    @basket = []
    @verify_order = verify_order
  end

  def add_to_basket(dish)
    @basket.push(dish)
  end

  def view_basket
    @verify_order.view_basket(self.basket)
  end

  def order_confirmation
    @verify_order.text_order_confirmation
  end

end
