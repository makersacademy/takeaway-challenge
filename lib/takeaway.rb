require_relative 'menu'

class Takeaway

  attr_accessor :items, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @items = Hash.new(0)

    @balance =0
  end

  def add(item, quantity = 1)
    raise "This item is not available.  Please select another item." unless @menu.dishes.key?(item)
    @items[item] += quantity
    puts "* You added #{quantity}x #{item}s to the order *"
    @balance += @menu.dishes[item] * quantity
    show_balance
  end

  def read_menu
    print @menu.dishes
  end

  def total_price
    puts "***This is your current order***"
      @items.each do |item, price|
        puts "#{item} #{price}x = £#{@menu.dishes[item] * price}"
      end
    show_balance
  end

  def show_balance
    puts "*** Your total is £#{ @balance.round(2) } ***"
  end

  def send_text(message)
    # this method calls the Twilio API
  end
end

t = Takeaway.new
#  t.add 'soda', 1
t.add 'pizza', 3
t.add 'drink', 2

t.total_price

