require 'csv'

class Menu
  def initialize(items = "./lib/menu.csv") 
    @items = []
    load_menu(items)
  end

  def to_s
    menu = "#{"Welcome to Bob's Burritos!".rjust(57)}\n"
    @items.each_with_index do |item, index| 
      menu << "\n#{item[:dish].rjust(40)} - dish: #{index + 1} -" \
      + "£#{'%.2f' % item[:price]}".rjust(8)
    end
    menu
  end

  def dish_info(index)
    [@items[index][:dish], @items[index][:price]]
  end

  private

  def load_menu(items)
    CSV.foreach(items) do |item|
      dish, price = item
      @items << { dish: dish, price: price.to_f }
    end
  end
end
