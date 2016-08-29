#understands an order

class Order

  def initialize
    @order_content = Hash.new(0)
    @checkout_value = nil
  end

  #add dish with quantity and sum to the order
  def add_item(dish, quantity)
    sum = dish.price * quantity #sum is calculated
    finish_adding_item(dish, quantity, sum)
  end

  def complete? #checks if the order is complete or not
    !!checkout_value #order is complete if checkout value added
  end

  def order_summary #returns order summary
    order_content.to_a.map { |elem| summary_message(elem) }.join(", ")
  end

  def checkout_order(amount)
    fail "Order cannot be checked out with no dish" if order_content.empty?
    fail "Checkout amount is not correct" unless checkout_amount_valid?(amount)
    @checkout_value = amount
  end

  def total #returns total value of the order
    return 0 if order_content.empty?
    order_content.to_a.map { |elem| elem[1][:sum] }.inject(:+)
  end

  private
  attr_reader :checkout_value, :order_content

  def summary_message(elem) #returns message content to the summary
    "#{elem[0].name} x#{elem[1][:quantity]} = #{elem[1][:sum]}"
  end

  def finish_adding_item(dish, quantity, sum)
    if order_content.include?(dish) #grooups the same dishes into one
      order_content[dish][:quantity] += quantity
      order_content[dish][:sum] += sum
    else @order_content[dish] = {quantity: quantity, sum: sum}
    end
  end

  def checkout_amount_valid?(amount) #validates checkout amount
    total == amount
  end
end
