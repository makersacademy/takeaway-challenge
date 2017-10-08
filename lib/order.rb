require_relative "menu"

class Order

  attr_reader :order

  def initialize
    @order = []
  end

  def see_menu
    Menu.new.print_menu
  end

  def order_item
    puts "Enter the item you would like: "
    item = gets.chomp.upcase
    price = Menu.new.tapas.fetch(item)
    @order << { item => price }
  end

  def view_order
    @order.each do |item|
      item.each do |key, value|
        puts " #{key}   #{value} \n\n"
      end
    end
  end

  def order_total
    prices = @order.map { |item| item.values }
    price = prices.flatten.sum
    puts "Your total price is £#{price}"
  end

end
