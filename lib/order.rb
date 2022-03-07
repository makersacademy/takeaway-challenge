class Order
  def initialize(order_contents = [])
    @order_contents = order_contents

  end

  def add_to_order(food)
    @order_contents << food
  end

  def show_price
    total = 0.00
    @order_contents.each do |food|
      total += food.price
    end
    return total
  end

end
