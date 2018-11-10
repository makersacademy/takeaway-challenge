class Customer
  def initialize(name, phone_number, order = Order.new)
    @name = name
    @phone_number = phone_number
    @order = order
  end

  def select_dishes(array)
    @order.build(array)
  end

  def print_order
    @order.print
  end

  def varify_order
    @order.varify
  end
end
