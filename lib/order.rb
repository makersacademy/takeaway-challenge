require_relative 'menu'

class Order

attr_reader :basket, :menu

  def initialize
    @basket = []
    @menu = Menu.new
  end

  def add(item, quantity = 1)
    (quantity).times { @menu.contents.each { |option| @basket << option if option[:pizza] == item } }
  end

  def total
  @basket.map { |item| item[:price] }.sum
  end

  def check
    puts "This is what your order looks like:"
    order_summary
    puts "Total cost:".ljust(20) + "£#{total}"
  end

private
def order_summary
  puts "PIZZA".ljust(20) + "PRICE"
  @basket.each { |item| puts "#{item[:pizza]}".ljust(20) + "£#{item[:price]}" }
end

end
