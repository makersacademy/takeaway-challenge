class Order

  def initialize
    @order_content = {}
    @checkout_value = nil
  end

  def add_item(dish, quantity)
    sum = dish.price * quantity
    finish_adding_item(dish, quantity, sum)

  end

  def complete?
    !!checkout_value
  end

  def order_summary
    order_content.to_a.map { |elem| summary_message(elem) }.join("\n")
  end

  def checkout_order(amount)
    fail "Order cannot be checked out with no dishes" if order_content.empty?
    @checkout_value = amount
  end

  def total
    0 if order_content.empty?
    order_content.to_a.map { |elem| elem[1][:sum] }.inject(:+)
  end

  private
  attr_reader :checkout_value, :order_content

  def summary_message(elem)
    "#{elem[0].name} x#{elem[1][:quantity]} = #{elem[1][:sum]}"
  end

  def finish_adding_item(dish, quantity, sum)
    if order_content.include?(dish)
      order_content[dish][:quantity] += quantity
      order_content[dish][:sum] += sum
    else @order_content[dish] = {quantity: quantity, sum: sum}
    end
  end

end
