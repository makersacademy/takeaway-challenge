class Order
attr_reader :basket
  def initialize
    @basket = {}
  end

  def make_order(dish, quantity)
    add_to_basket(dish, quantity)
    # basket.merge!(dish quantity)
    "added to basket: #{dish} x#{quantity}"
  end

  def check_order
  end


private

def add_to_basket(dish, quantity)
  basket[dish] = quantity
end

end
