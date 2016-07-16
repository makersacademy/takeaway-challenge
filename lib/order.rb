require_relative 'menu'
# require 'pry'

class Order

  def select(orders)
    a = 0
    orders.each do |dish, number|
      a += number
    end
    a
  end

end
