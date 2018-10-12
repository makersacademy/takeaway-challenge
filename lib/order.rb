require_relative 'customer'
require_relative 'dish'

class Order

  attr_reader :order

  def initialize
    @order = []
    @counts = Hash.new(0)
    @list = Array.new
  end

  def print_list
    @order.each do |x|
      @counts[x] += 1
    end
    @counts.each do |key, value|
      @list << "#{key.name} x#{value} $#{value * key.price}"
    end
    @list
  end

  def added?
    @order.empty? ? false : true
  end
end
