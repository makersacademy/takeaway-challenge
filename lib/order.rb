class Order

  attr_reader :order, :amount

  def initialize
    @order, @amount = [], []
  end

  def add_to_order dish, quantity
      amount << quantity
      order << dish
  end

  def total_price
    total, count = 0, 0
    order.each do |item|
      total += (item.price * amount[count])
      count += 1
    end
    total
  end

  def show_order
    count = 0
    output = ''
    order.each do |dish|
      quantity = order.count(dish)
      output += "\n#{dish.show_details} X#{amount[count]}"
      count += 1
    end
    output
  end

  def place_order payment
    fail "Payment doesn't match total!" if payment != total_price
    show_order
    total_price
    Text.new.send_text
  end
end
