require_relative 'menu'
require_relative 'text'

class Order

  attr_reader :basket, :menu

  def initialize
    @basket = []
    @menu = Menu.new
  end

  def add(item, quantity = 1)
    fail "That is not on the menu" unless @menu.contents.any? { |hash| hash[:pizza] == item }

    quantity.times { @menu.contents.each { |option| @basket << option if option[:pizza] == item } }
  end

  def total
    @basket.map { |item| item[:price] }.sum
  end

  def check
    puts "This is what your order looks like:"
    puts "PIZZA".ljust(20) + "PRICE"
    @basket.each { |item| puts "#{item[:pizza]}".ljust(20) + "£#{item[:price]}" }
    puts "Total cost:".ljust(20) + "£#{total}"
  end

  def complete(phone_number)
    Text.new(phone_number)
  end

end
