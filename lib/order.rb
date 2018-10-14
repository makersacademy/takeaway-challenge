class Order
  attr_reader :current_order

  def initialize(mobile_num = 001)
    @mobile_num = mobile_num
    @current_order = []
  end

  def add(item, quantity)
    quantity.times { @current_order << item }
  end

  def remove(item)
    @current_order.delete(item)
  end

  def view
    @current_order.each { |i| puts "#{i.name} - £#{i.price}" }
  end

  def total
    @current_order.map {|i| i.price}.sum
  end

end
