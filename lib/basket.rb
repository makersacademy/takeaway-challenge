require 'formatter'

class Basket
  include Formatter

  def initialize
    @basket = Hash.new
  end

  def add(order, quantity)
    if @basket.key?(order.name)
      @basket[order.name].quantity += quantity
    else
      @basket[order.name] = order
    end
  end

  def list
    @basket.each { |k, v|
      puts "#{k} x#{v.quantity}: #{format_price(v.price * v.quantity)}"
    }
  end

  def empty
    @basket = Hash.new
  end

  def empty?
    @basket.empty?
  end

  def print_total
    puts "Total: #{format_price(total)}"
   end

  def total
    @basket.values.map{ |order| order.price * order.quantity }.sum
  end
end
