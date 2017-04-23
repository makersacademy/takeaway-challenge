require "./lib/takeaway.rb"
require "./lib/confirmation.rb"

class Order < Takeaway
  attr_reader :items

  def initialize
    @items = []
    @total = total
  end

  def add(item, quantity)
    fail "Item not on menu" unless menu.include?(item)
    puts "#{quantity}x #{item} added to the order."
    cost = menu[item]
    @items << [item, cost, quantity]
  end

  def check
    items.each { |x| puts "#{x[0]} = £#{x[1]}\n" * x[2] }
    "Total: £#{total}"
  end

  def print_total
    "£#{total}"
  end

  def submit
    confirm
  end

private

  def total
    items.map { |x| x[1] * x[2] }.reduce(:+)
  end

  def confirm
    confirmation = Confirmation.new
    confirmation.message
  end

end
