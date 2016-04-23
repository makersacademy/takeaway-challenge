class Order

  def initialize
    @dishes_ordered = []
  end

  def add(dish, quantity)
    @dishes_ordered << {dish: dish, quantity: quantity}
  end

  def payment(total)
    err = "Unverified order: payment does not match order sum. Change payment."
    fail err if total != calculate_price
  end

  private

  def calculate_price
    order_sum = 0
    @dishes_ordered.each do |hash|
      order_sum += hash[:dish].price * hash[:quantity]
    end
    order_sum
  end

end
