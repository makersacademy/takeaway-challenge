require './lib/text.rb'
require './lib/order.rb'

class Takeaway

  attr_reader :items, :text, :order, :menu

  def initialize(text = Text.new, order = Order.new)
    @menu = [
              { item: 'Burger', price: 4 },
              { item: 'Chips', price: 2 },
              { item: 'Chicken', price: 5 }
            ]
    @items = []
    @text = text
    @order = order
  end

  def print_menu
    puts "Menu".center(50)
    @menu.each_with_index do |x, i|
        puts "#{i+1}.#{x[:item]} £#{x[:price]}".center(50)
    end
  end

  def add_to_items(item)
    @items << select_item(item)
    puts_item(item)
  end

  def total
    @order.total(@items)
  end

  def check_total
    @order.check_total(@items, total)
  end

  def finalize_order
    @text.send_text(total)
  end

private

  def select_item(item)
    @menu.select do |x|
      x[:item].include?(item)
    end
  end

  def puts_item(item)
    puts "#{item} added to order!"
  end

end
