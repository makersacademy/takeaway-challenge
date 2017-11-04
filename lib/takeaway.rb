require './lib/text.rb'
require './lib/order.rb'

class Takeaway

  attr_reader :items, :text, :order, :menu

  def initialize(text = Text.new, order = Order.new)
    @menu = [
              { name: 'Burger', price: 4, amount: 1 },
              { name: 'Chips', price: 2, amount: 1 },
              { name: 'Chicken', price: 5, amount: 1 }
            ]
    @items = []
    @text = text
    @order = order
  end

  def choose_item(item)
    choice = menu_select(item)
    add_to_items(choice)
  end

  def add_to_items(item)
    @items << item
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

  def menu_select(chosen_food)
    @menu.select { |x| x[:name].include?(chosen_food) }
  end

end
