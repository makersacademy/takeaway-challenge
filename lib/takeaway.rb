require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
  end

  def new_order
    @order = Order.new
  end

  def gets_input
    puts "Menu:"
    puts menu.show_dishes
    new_order
    loop do

      puts "What would you like to order from the menu above?"
      item = STDIN.gets.chomp
      puts "How many?"
      amount = STDIN.gets.chomp
      puts "Would you like to order some more?"
      more = STDIN.gets.chomp

      break if more != "yes"
    end

  end

def save_input(item, amount)
  amount.times {order.items << menu.dishes[item]}
end


end
