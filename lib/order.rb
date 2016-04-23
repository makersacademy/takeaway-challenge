class Order

  def initialize
    @dishes_ordered = []
  end

  def add(dish, quantity)
    @dishes_ordered << {dish: dish, quantity: quantity}
  end

  def payment(total)
    err = "Unverified order: payment does not match order sum. Change payment."
    msg = "Thank you!"\
    " Your order was placed and will be delivered before #{get_time}"
    fail err if total != calculate_price
    msg
  end

  private

  def calculate_price
    order_sum = 0
    @dishes_ordered.each do |hash|
      order_sum += hash[:dish].price * hash[:quantity]
    end
    order_sum
  end

  def get_time
    one_hour = Time.now + 60*60
    one_hour.localtime.strftime("%H:%M")
  end

end
