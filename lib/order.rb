class Order
  attr_reader :ordered

  def initialize
    @ordered = []
  end

  def take_an_order(dish)
    @ordered << dish
  end

  def show_order
    @ordered.each { |order| puts order.name }
  end

  def show_total
    total = 0
    @ordered.each { |order| total += order.price }
    puts "Total cost is £#{total}"
  end

end
