require_relative 'order'
require_relative 'text'

class Takeaway
  attr_reader :order, :menu, :text
  attr_accessor :order #added for testing of choose method

  MENU_LIST = [{name: 'Bolognese', price: 6}, {name: 'Kotbullar', price: 7.50}, {name: 'Beetroot tart', price: 11.20}]

  def initialize(menu = MENU_LIST, order = Order.new, text = Text.new)
    @order = order
    @menu = menu
    @text = text
  end

  def see_menu
    @menu.each do |dish|
      puts "Dish: #{dish[:name]}, price: #{dish[:price]}"
    end
  end

  def choose(dish,amount=1)
    choice = @menu.select { |item| item[:name] == dish }
    fail "Sorry, we do not have this dish." if choice.empty?
    @order.add(choice[0],amount)
  end

  def check_total
    puts "You have ordered: "
    print_order
    puts "The calculated total is #{@order.total}"
  end

  def print_order
    @order.list.each do |dish|
      puts "Dish: #{dish[:name]}, price: #{dish[:price]}, amount: #{dish[:amount]}"
    end
  end

  def place_order
    check_total
    if place_order?
      text.send(@order.total)
      puts "Your order has been placed. You should receive confirmation via text"
    else
      puts "Your order has not been placed"
    end
  end

  def place_order?
    puts "Do you want to place the order? (y/n)"
    $stdin.gets.chomp == 'y' ? true : false
  end

end
