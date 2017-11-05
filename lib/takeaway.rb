require './lib/text.rb'
require './lib/order.rb'

class Takeaway

  attr_reader :items, :text, :order, :menu

  def initialize(text = Text.new, order = Order.new)
    @menu = [
              { name: 'Burger', price: 4 },
              { name: 'Chips', price: 2 },
              { name: 'Chicken', price: 5 }
            ]
    @items = []
    @text = text
    @order = order
  end

  def add_to_items(item)
    @items << select_item(item)
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
      x[:name].include?(item)
    end
  end
end
