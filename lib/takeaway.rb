require_relative 'menu'
require_relative 'basket'

class TakeAway

  attr_reader :menu, :basket, :total

def initialize
  @menu = Menu.new
  @basket = Basket.new(@menu.items)
  @total = 0
end

def view_menu
  @menu.view_menu
end

def order(dish, quantity = 1)
  basket.add_item(dish, quantity)
end

def view_basket
  @basket.selected_items
end

def view_total
  @total = @basket.total
  "The current total of your basket is £#{("%.2f" % @total)}"
end

def print_summary
  puts "Your basket currently contains:"
  @basket.selected_items.each do | item |
    item.each do |dish, quantity|
      puts "#{dish}\t £#{quantity}"
    end
  end
  puts "\nTotal:\t £#{("%.2f" % @total)}"
end


private

  def state_total
    "The current total of your order is £#{@total}"
  end

end
