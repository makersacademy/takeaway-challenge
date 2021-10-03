require_relative 'menu_pizza'

class Takeaway

  attr_accessor :items, :menu, :balance

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

  def remove(item, quantity = 1)
    raise "This item is not available.  Please select another item." unless @items.key?(item)
    @items[item] -= quantity
    puts "* You removed #{item}s from the order *"
    @balance -= @menu.dishes[item] * quantity
    show_balance
  end


  def read_menu
    puts @menu.dishes
  end

  def show_order
    puts "***This is your current order***"
      @items.each do |item, price|
        puts "#{item} #{price}x = £#{@menu.dishes[item] * price}"
      end
  end

  def show_balance
    puts "*** Your total is £#{ @balance.round(2) } ***"
  end

  def complete_order
    puts "Your order is complete.  You will be texted with delivery information.  Thank you for ordering!"
    show_balance
    send_text
  end

  def send_text
    require_relative 'messenger'
  end
end


