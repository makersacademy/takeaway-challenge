class Order
  attr_accessor :ordered

  def initialize
    @ordered = []
  end

  def show_order
    nothing_ordered
    @ordered.each { |order| puts order.name }
  end

  def show_total
    nothing_ordered
    puts "Total cost is £#{find_total}"
  end

  private

  def nothing_ordered
    raise 'nothing has been ordered yet' if @ordered.empty?
  end

  def find_total
    total = 0
    @ordered.each { |order| total += order.price }
    return total
  end

end
