class Order
  attr_reader :order, :confirm_order

  def initialize(new_order_from_takeaway)
    @order = new_order_from_takeaway.new_order
    @confirm_order = false
  end

  def total_charge
    @order.map(&:values).flatten.sum
  end

  def print_order
    @order.each do |item|
      item.each { |k,v| puts "#{k.ljust(18)} £#{v}" }
    end
    print_total
  end

  def print_total
    22.times { print "-" }
    puts "\nTotal:             £#{total_charge}"
  end

  def confirm_order?(yes_or_no)
    @confirm_order = true if yes_or_no == "yes"
  end
end
