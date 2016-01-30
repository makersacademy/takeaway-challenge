require_relative 'menu'
require_relative 'calculate_bill'

class Order 

  attr_reader :ordered_items, :list_of_orders
  attr_accessor :cost

  def initialize
    @ordered_items = {}
    @list_of_orders = [@ordered_items]
  end

  def show_menu
    tidy_menu
  end

  def choose(pizza, quantity)
    ordered_items[pizza] = quantity
    ordered_items = {}
  end

end

private

 def tidy_menu
  puts
  puts "PIZZA"
  puts
  puts MENU.map{ |k,v| (k + "  £" + v.to_s) }
  puts
  return  'Please choose from the above list'
 end
