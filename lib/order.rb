class Order

  def initialize(dishes = [])
    @dishes = dishes
  end

  def total
    sum = 0
    @dishes.each { |dish, quantity| sum = + (dish.price * quantity) }
    sum
  end

  def add(dish, number = 1)
    @dishes.push([dish, number])
  end

  def list_dishes
    @dishes
  end

  def total_quantity
    total = 0
    @dishes.each { |_item, quantity| total += quantity }
    total
  end

  def calculate_time
    time = Time.now
    "#{(time + 3600).strftime("%H:%M")}"
  end

  def confirm_order(time = calculate_time)
    message = "Thank you! Your order was placed and will be delivered before #{time}"
    return message if @confirmation == "Confirm"
  end
end
