require_relative 'menu.rb'
class Order

  attr_reader :total, :order

  def initialize
    @order = Array.new
    @total = 0
    @n = 0
  end

  def add_to_order(dish)
    @order << dish.name.capitalize
    @a_price = dish.price
    @total += @a_price
    @order
  end

  def show_order
    @order.each do |name|
      @n += 1
      puts "#{@n} #{name}"
    end
    puts "YOUR TOTAL IS £#{@total}"
  end


end
