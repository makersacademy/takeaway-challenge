class Takeaway

  attr_reader :list, :recorded_orders
  attr_accessor :all_costs

  def initialize
    @list = { "chicken" => 4, "lamb" => 7, "vegetables" => 3, "iced latte" => 2 }
    @all_costs = 0
    @recorded_orders = []
  end

  def see_list
    puts "Dishes".ljust(10) + "Prices".rjust(10)
    puts "--------------------"
    list.keys.each { |x| puts (x.capitalize).ljust(10) + list[x].to_s.rjust(10) }
  end

  def place_order(dish, quantity)
    quantity.times { recorded_orders << dish }
    value = list[dish] * quantity
    total(value)
  end

  def exact_sum
    change = recorded_orders.map { |x| list[x] }
    change.inject(:+)
  end

  def total(value)
    self.all_costs += value
  end

  def check
    return successful if self.exact_sum == self.all_costs
    fail "Your order costs is incorrect"
  end

  def successful
    puts "Thank you! Your order was placed and will be delivered soon!"
  end

end