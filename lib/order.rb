require_relative 'menu'

class Order

  attr_reader :order, :amount

  def initialize
    @order, @amount = [], []
  end

  def add_to_order menu, dish, quantity
      fail 'Item not on menu' if menu.dishes.include?(dish) == false
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
    fail "Incorrect Payment" if payment != total_price
    show_order
    total_price
    Text.new.send_text
  end
end
