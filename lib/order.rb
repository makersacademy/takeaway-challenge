require_relative 'menu'

class Order
  attr_reader :order

  def initialize(menu = Menu.new)
    @order = Hash.new{0}
    @menu = menu
  end

  def add_to_order(item_index,quantity)
    @order[menu.keys[item_index]] += quantity
  end

  def place_order
    total_cost
    receipt
  end

  def receipt
    puts "Thank you for ordering at Su's Takeaway"
    puts "Your order today was:"
    item_list
    puts "The total amount for this order is £#{'%.2f' % total_cost}"
  end

  def total_cost
    total = 0
    @order.each do |item, quantity|
      price = menu[item] 
      total += price * quantity
    end
    total
  end

  private

  def item_list
    @order.each do |item, quantity| 
      price = menu[item]
      puts "#{quantity}x #{item} £#{'%.2f' % price} each" end
  end

  def menu
    @menu.menu
  end
end
