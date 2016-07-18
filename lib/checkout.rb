require_relative 'order'

attr_reader :total, :basket

class Checkout

  def initialize(order)
    @order = order
  end

  def charge(order)
    raise error "You have not added any items to your basket" if no_items_in_basket
    "Your total is £#{order.total}"
  end

  def no_items_in_basket
    @basket.length < 1
  end
end
