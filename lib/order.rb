require_relative 'menu'
# require 'pry'

class Order

  def select(orders)
    fail "Bad order! Check your maths." if !correct?
    a = 0
    orders.each do |dish, number|
      a += number
    end
    a
  end

  def correct?
    false
  end


end
