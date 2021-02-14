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
    (quantity).times do
      @menu.contents.each do |option|
         @basket << option if option[:pizza] == item
      end
    end
  end

  def total
  @basket.map { |item| item[:price] }.sum
  end

  def check
    puts "This is what your order looks like:"
    order_summary
    puts "Total cost:".ljust(20) + "£#{total}"
  end

  def complete(phone_number)
    Text.new(phone_number)
  end

private
def order_summary
  puts "PIZZA".ljust(20) + "PRICE"
  @basket.each { |item| puts "#{item[:pizza]}".ljust(20) + "£#{item[:price]}" }
end

end
