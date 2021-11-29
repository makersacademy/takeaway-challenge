class Order

  attr_reader :total

  ORDER_TIME = 30

  def initialize
    @items = []
    @total = 0
  end

  def add(item)
    @items.push(item)
    @total += item.price
  end

  def show
    @items.dup
  end

  def check_total
    total = 0
    @items.each { |dish| total += dish.price }
    @total == total
  end

  def message
    message = "Your order has been received and will be delivered by #{(Time.now + (60 * ORDER_TIME)).strftime("%k:%M")}\nOrder details:\n"
    @items.each { |dish| message += "#{dish.name}, £#{dish.price}\n" }
    message += "Total: £#{@total}"
  end

end
