class Takeaway
  attr_accessor :order
  attr_reader :menu_ready
  def initialize menu
    @menu_ready = menu
  end

  def show_menu
    menu_ready.create_menu
  end

  def place_order
    customer_selection = ARGV.first
    prompt = '>'
    puts "Please, place your order", prompt
    @order = ($stdin.gets.chomp).split(',').map(&:to_i)
  end

  def total
    order_prices = []
    @order.each { |index| order_prices << @menu.values[index - 1] }
    total = order_prices.inject(:+)
  end
end

# p takeway = Takeaway.new(Menu.new)
# p takeway.show_menu