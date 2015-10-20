class Order

  attr_reader :customer_name, :customer_phone_number, :order_dishes

  def initialize(customer_name,
                 customer_phone_number,
                 order_dishes,
                 order_time=Time.new)
    @customer_name = customer_name
    @customer_phone_number = customer_phone_number
    @order_dishes = order_dishes
    @order_time = order_time
  end

  def total_amount
    sum = 0
    order_dishes.each do |dish, quantity|
      sum += (dish.price * quantity)
    end
    sum
  end

  def delivery_time
    @order_time + (60*60)
  end

end