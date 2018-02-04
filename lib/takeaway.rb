require_relative 'order'
require_relative 'menu'

class Takeaway

  attr_reader :menu, :order, :total

  def initialize
    @menu = Menu.new.items
    @total = 0
    @order = Order.new
    @final_order = {}
  end

  def new_order(dish)
    order = { dish => @menu[dish] }
    @order.save_order(order)
  end

  def current_total
    current_total = 0
    order.items.each do |item|
      item.each_value { |price| current_total += price }
    end
    current_total
  end

  def place_order
    order_total
    final_order
    puts "you have ordered: "
    print_order
    puts "for a total of £#{total}."
  end

  private

  def order_total
    order.items.each do |item|
      item.each_value { |price| @total += price }
    end
  end

  def final_order
    @order.items.each do |item|
      item.each_key { |food|
        @final_order.key?(food) ? @final_order[food] += 1 : @final_order[food] = 1
      }
    end
  end

  def print_order
    @final_order.each do |food, amount|
      puts "#{amount} #{food}"
    end
  end

end
