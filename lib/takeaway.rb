require_relative 'menu'
require_relative 'menu_item'

class Takeaway
  attr_reader :menu
  def initialize(menu)        
    @menu = menu
  end

  def welcome_output
    puts 'Welcome to the Takeaway, what would you like to do?'
  end

  def option_output
    puts 'Enter 1 to view menu, 2 to order food.'
    select_choice(receive_choice)
  end

  def receive_choice
    return gets.chomp.to_i
  end

  def select_choice(choice)
    case choice
    when 1 
      view_menu
    when 2
      puts "Please enter the number of the dishes you would like to select, separated by a comma."
    end
  end

  def input_order
    return gets.chomp.downcase.split(",")
  end

  def create_order(order)
    return order.map { |entry|
      entry.to_i - 1
    }
  end

  def total(order)
    total = 0
    order.each { |item_n|
      total += @menu.menu_items[item_n].price
    }
    return total
  end

  def receipt(order, total)
    puts "Receipt"
    order.each { |item_n|
      puts "#{@menu.menu_items[item_n].name} £#{@menu.menu_items[item_n].price}"
    }
    puts "----------------------------"
    puts "Your order total is £#{total}"
  end

  def view_menu
    @menu.menu_items.each_with_index { |item, index| 
      puts "#{index + 1}. #{item.name} £#{item.price}"
    }
  end

end

def create_my_takeaway
  return Takeaway.new(Menu.new(MenuItem.new('Item1', 5), MenuItem.new('Item2', 10)))
end
