class Order
  attr_reader :order

  def initialize(new_order_from_takeaway)
    @order = new_order_from_takeaway.new_order
  end

  def total_charge
    @order.map(&:values).flatten.sum
  end

  def print_order
    @order.each do |item|
      item.each { |k,v| puts "#{k.ljust(18)} £#{v}" }
    end
    22.times { print "-" }
    puts "\nTotal:             £#{total_charge}"
  end
end
