class Order

  attr_reader :customer_name, :customer_phone_number, :order_dishes

  def initialize(customer_name, customer_phone_number, order_dishes)
    @customer_name = customer_name
    @customer_phone_number = customer_phone_number
    @order_dishes = order_dishes
  end

  def total_amount
    sum = 0
    order_dishes.each do |dish, quantity|
      sum += (dish.price * quantity)
    end
    sum
  end

end