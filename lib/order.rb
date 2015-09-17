require_relative 'menu'

class Order

  attr_reader :order, :amount

  def initialize
    @order = []
    @amount = []
  end

  def add_to_order menu, dish, quantity
      dish_included?(menu, dish)
      amount << quantity
      order << dish
  end

  def total_price
    total = 0
    order.each_with_index do |item, index|
      total += (item.price * amount[index])
    end
    total
  end

  def show_order
    output = ''
    order.each_with_index do |dish, index|
      output += "\n#{dish.show_details} X#{amount[index]}"
    end
    output
  end

  def place_order(payment)
    fail "Incorrect Payment" if payment != total_price
    show_order
    total_price
    Text.new.send_text
  end

  private

  def dish_included?(menu, dish)
    fail 'Item not on menu' if menu.dishes.include?(dish) == false
  end

end
