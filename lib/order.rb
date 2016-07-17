require_relative 'menu'

class Order

  def initialize
    @menu = Menu.new
  end

  def select(order)
    fail "Bad order! Check your maths." if !correct?(order)
    "Good job!"
  end

  def correct?(order)
    sum = order[-1]
    order_hash = order[0]
    total = order_hash.keys.inject(0) do |cost, key|
      cost + order_hash[key] * @menu.menu[key]
    end
    sum == total ? true : false
  end

end

=begin

a = 0
orders.each do |dish, number|
  a += number
end
a

=end
