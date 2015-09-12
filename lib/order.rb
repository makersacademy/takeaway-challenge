require_relative 'customer'

class Order

  attr_accessor :order

  def initialize
    @order = []
    @order_total = 0
    @quantity = 0
  end

  def order
    a.each do |v|
      b[v] += 1
    end

    b.each do |k, v|
      puts "#{k} appears #{v} times"
    end
  end
end
