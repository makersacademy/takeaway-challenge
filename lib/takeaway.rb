require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def place_order
    show_mains
    show_desserts
    take_order
  end

  def take_order
    loop do
      puts "What would you like to order from the menu above?"
      item = STDIN.gets.chomp
      puts "How many?"
      amount = $stdin.gets.chomp

      add_order(item, amount)

      puts "Would you like to order more dishes?"
      more = $stdin.gets.chomp
      break if more.downcase != "yes"
    end
  end

  def add_order(dish, amount)
     menu.mains.each do |hash|
       amount.times {order.items << hash} if hash[:name] == dish
     end
     menu.desserts.each do |hash|
       order.items << hash if hash[:name] == dish
     end

  end


end
