require_relative 'ordering.rb'

class Takeaway
  attr_reader :orders

  def initialize(orders = Ordering.new)
    @orders = orders
  end

  def view_menu
    { Burger: 4, Fish: 4, Sausage: 4, Chips: 1 }
  end

  def check_order
    total = view_menu.map { |k, v| v * @orders.ordered[k] if @orders.ordered.key? k }.compact.sum
    puts "Please enter total cost:"
    amount = gets.chomp
    fail "Please recheck" if amount.to_i != total
  end
end
