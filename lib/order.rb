class Order

  attr_reader :items, :time_placed

  def initialize(customer)
    @items = []
    @complete = false
    @customer = customer
  end

  def add(item)
    @items << item
  end

  def send
    @time_placed = Time.now
    @notification = CustomerNotification.new(@customer, self)
    @notification.notify
    @complete = true
  end


  def complete?
    @complete
  end

  def print_order
    order_string = ""
    @items.each_with_index do |item, index|
      order_string << "#{index + 1}. #{print_item(item)}"
    end
    order_string
  end

  def print_item(item)
    "#{item.name}: X#{item.quantity}\n"
  end

  def total(calculator)
    calculator.total(self)
  end
end
