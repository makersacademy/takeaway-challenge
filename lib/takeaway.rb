require 'messenger'

class Takeaway
  attr_accessor :menu, :items, :balance

  def initialize(menu = Menu.new)
    @menu = menu
    @items = Hash.new(0)
    @balance = 0
  end

  def read_menu
    @menu.dishes
  end

  def add_order(item, quantity = 1)
    @items[item] += quantity
    @balance += @menu.dishes[item] * quantity
    "You added #{quantity}x #{item} to your basket"
  end

  def remove_order(item, quantity = 1)
    @items[item] -= quantity
    @balance -= @menu.dishes[item] * quantity
    "You removed #{quantity}x #{item} from your basket"
  end  

  def basket_summary
    @items.each do |item, price|
      puts "#{item} #{price}x = £#{@menu.dishes[item] * price}"
    end
  end

  def total
    "Your total is £#{@balance.round(2)}"
  end

  def complete_order
    total
    send_text
  end

  def send_text
    require_relative 'messenger'
  end
end

class Menu
  attr_accessor :dishes

  def initialize
    @dishes = {
      "pizza" => 12.99,
      "spaghetti bolognese" => 14.99,
      "salad" => 8.99,
      "caprese open sandwich" => 9.99,
      "cheese pizza" => 9.99
    }
  end
end
