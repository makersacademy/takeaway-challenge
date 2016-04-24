class ContentManager

  attr_reader :customer

  def initialize(customer)
    @customer = customer
  end

  def delivery_time
    current_time = Time.now
    Time.now + 60*60
  end

  def body_msg(order_cost)
    eta = delivery_time
    "Hi #{customer.name}, thank you for your order of #{order_cost}€.
    Your food will be delivered before #{eta.strftime("%H:%M")}"
  end


end