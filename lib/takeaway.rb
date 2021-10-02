require_relative 'menu'
require_relative 'messenger'

class Takeaway

  attr_accessor :items, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @items = Hash.new(0)

    @balance =0

  end

  def add(dish, quantity = 1)
    @items[dish] += quantity
    puts "we added #{quantity}x #{dish}s to your order"
    @balance += @menu.dishes[dish] * quantity
    puts "your balance is #{@balance}"
  end

  def read_menu
    print @menu.dishes
  end

  def total_price
    @items.reduce { |sum, item| sum + item }
  end

  def complete_order(price)
    send_text("Thank you for your order: £#{total_price}")
  end

  def send_text(message)
    # this method calls the Twilio API
  end
end

# t = Takeaway.new
# t.add 'pizza', 4
# t.add 'burger', 2
# print t.menu.dishes
# print t.items
# print t.menu.dishes

