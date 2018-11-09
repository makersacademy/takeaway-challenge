require_relative 'menu'

class Order
  attr_reader :menu, :order, :total

  def initialize()
    @menu = Menu.new
    @order = []
    @total = 0
  end

  def add(item,num)
    order << {item: item, num: num}
    @total += menu.items[item] * num
  end

  def check(number)
    fail "Your total does not match ours." if number != @total
    puts "Our totals match."
  end
end