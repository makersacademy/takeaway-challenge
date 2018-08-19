class Order
  attr_reader :total_order, :total
  def initialize
    @total_order = []
  end

  def add_dish(dish, quantity, price)
    @dish = dish
    @quantity = quantity
    @price = price
    already_in_order? ? update_order : @total_order << current_order 
    "Ordered - #{dish} x #{quantity}"
  end

  def final_order
    @total = 0
    order_string = total_order.map { |hash|
      @total += hash[:price]
      "#{hash[:dish]} x #{hash[:quantity]}"
    }.join(", ")
    "Order: #{order_string}  Total: £#{total}"
  end

  private
  attr_reader :dish, :quantity, :price

  def current_order
    { dish: dish, quantity: quantity, price: price * quantity }
  end

  def already_in_order?
    total_order.any? { |hash| hash[:dish] == dish }
  end

  def update_order
    total_order.each { |hash| 
      hash[:quantity] += quantity 
      hash[:price] += price * quantity if hash[:dish] == dish 
    }
  end

end
