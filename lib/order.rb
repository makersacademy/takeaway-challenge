class Order

  attr_reader :items, :time_placed

  def initialize(customer, menu)
    @items = []
    @complete = false
    @customer = customer
    @menu = menu
  end

  def add(item_add)
    selected_items = @menu.items.select {|item| item.name.include? item_add.name}
    raise "Item not found in menu!" if selected_items.empty?
    @items << item_add
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
    "#{item.name}: x#{item.quantity}\n"
  end

  def total(calculator)
    calculator.total(self)
  end
end
