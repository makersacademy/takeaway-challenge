require_relative 'menu'

class Order

  def initialize(menu = Menu.new)
    @order = Hash.new { 0 }
    @menu = menu
  end

  def add_to_order(item_index,quantity)
    @order[@menu.list.keys[item_index]] += quantity
  end

  def finish_order
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
      price = @menu.list[item] 
      total += price * quantity
    end
    total
  end

  def show_menu
    @menu.show_menu
  end

  def dish_name(index)
    @menu.list.keys[index]
  end

  def item_list
    @order.each do |item, quantity| 
      price = @menu.list[item]
      multi_price = price * quantity
      puts "#{quantity}x #{item} £#{'%.2f' % multi_price}" 
    end
  end
end
