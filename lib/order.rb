class Order

  def initialize(customer, takeaway)
    @customer = customer
    @takeaway = takeaway
    @order = Array.new
  end

  def add_order_line(item, quantity)
    # Ruh roh. An array of arrays?! Check that adding items works properly.
    @order << [item, quantity, quantity * @takeaway.item_price(item)]
  end

  def order_line(index)
    @order[index]
  end

  def total
    # Another messy array reference here
    @order.inject(0) { |accum, item| accum + item[2] }
  end

  def order
    output = Array.new
    output << @customer.name
    output << @takeaway.name
    output << @order
    output << total
  end

end
