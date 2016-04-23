class Order

  def initialize
    @dishes_ordered = []
  end

  def add(dish, quantity)
    @dishes_ordered << {dish: dish, quantity: quantity}
  end

  def check_total(total)
    err = "Unverified order: total does not match order sum. Change payment."
    msg = "Thank you!"\
    " Your order was placed and will be delivered before #{calculate_time}"
    fail err if unverified?(total)
    msg
  end

  private

  def calculate_price
    order_sum = 0
    @dishes_ordered.each do |item_hash|
      order_sum += item_hash[:dish].price * item_hash[:quantity]
    end
    order_sum
  end

  def calculate_time
    one_hour = Time.now + 60*60
    one_hour.localtime.strftime("%H:%M")
  end

  def unverified?(total)
    total != calculate_price
  end

end
