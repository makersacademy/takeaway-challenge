class Order
  # Note - I totally am *not* requiring someone to submit their own order total
  # because that makes no sense. I calculate from order lines, show total
  # and let them decide to buy. If we were doing it properly, we'd break any
  # connection between information in order lines and the live menu so that
  # orders stayed fixed once they've been made.

  attr_reader :status
  attr_reader :time

  def initialize(customer, takeaway)
    @customer = customer
    @takeaway = takeaway
    @order = []
    @status = :open
    @time = nil
  end

  def add_order_line(item, quantity)
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
    # Whoa this is terrible. .order and @order are totally different!
    output = []
    output << @customer.name
    output << @takeaway.name
    output << @order
    output << total
    output << status
  end

  def place(message)
    # We're injecting a pre-initialized object of Message class here
    # This is mainly so I can write test expectation on message.send
    @status = :placed
    @time = Time.new
    message.send(@customer, @time)
  end

end
