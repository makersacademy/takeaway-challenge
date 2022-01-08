require_relative 'menu'
require_relative 'order'

class TakeAway 

  

  def initialize 
    @menu = Menu.new
    @order = Order.new
    @finish = false
  end 

  def show_menu
    @menu.print_menu
  end

  def add(input, qua = 1)
    return puts "I'm afraid we don't have any #{input}" unless valid?(input)
    return puts "Order already complete, unable to add item" if finish?
    update_total(input)
    add_order(input, qua)
  end
  
  def valid?(input)
    @menu.items.has_key?(input.to_sym)
  end

  def update_total(input)
    @order.total += @menu.items[input.to_sym]
  end

  def add_order(input, qua)
    @order.selection[input] += qua
    puts "#{input} added to your order"
  end

  def no_items? 
    @order.total.zero?
  end

  def finish?
    @finish
  end 

  def complete
    return puts "Unable to complete order, no dishes selected" if no_items?
    @finish = true
    @order.confirm
    @order.send_sms
  end

end
