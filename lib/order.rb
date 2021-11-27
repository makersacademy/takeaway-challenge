require_relative 'dish'
require_relative 'text'

class Order 
  include Text
  
  attr_reader :menu, :basket

  def initialize
    @menu = []
    @basket = []
  end

  def add_item(dish)
    raise "Cannot add #{dish}. Item not on menu!" if not on_menu?(dish)
    selected_dish = @menu.find { |item| item.name == dish }
    selected_dish.increase_qty 
    @basket << selected_dish unless @basket.include?(selected_dish) 
  end

  def remove_item(dish)
    raise "Cannot remove #{dish}. Item not in basket!" if not in_basket?(dish)
    selected_dish = @basket.find { |item| item.name == dish }
    @basket.delete(selected_dish) if selected_dish.last_one?
    selected_dish.decrease_qty unless selected_dish.none_selected?
  end

  def get_summary
    puts "\nYour order so far: \n#{print_order_msg}"
  end

  def submit_order
    puts "\nThank you for your order: \n#{print_order_msg}"
    qtys_to_0
    empty_basket
    send_text
  end

  private 

  def on_menu?(dish)
    @menu.any? { |item| item.name == dish }
  end

  def in_basket?(dish)
    @basket.any? { |item| item.name == dish }
  end

  def print_order_msg
    puts "-------------------"
    subtotal = 0
    @basket.each { |dish| 
      subtotal += (dish.price * dish.qty)
      puts "#{dish.name}(#{dish.qty}): £#{dish.price * dish.qty}"
    }
    puts "-------------------"
    puts "subtotal: £#{subtotal}"
    puts "-------------------"
  end

  def qtys_to_0
    @menu.each { |dish| dish.set_qty_to_0 }
  end

  def empty_basket
    @basket.clear
  end

end