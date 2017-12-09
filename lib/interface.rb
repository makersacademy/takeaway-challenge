require './lib/menu.rb'
require './lib/order.rb'

class Interface

  def initialize
    @menu = Menu.new
    @order = Order.new
    input
  end

  def input
    puts "Type in number for interface action"
    options
    res = gets.chomp
    response(res)
  end

  def options
    puts "1. Look at menu"
    puts "2. Order items"
    puts "3. Look at order"
    puts "4. Place order"
    puts "9. Exit"
  end

  def response(res)
    case res
    when "1"; showm
    when "2"; order_items
    when "3"; look_at_order
    when "4"; place_order
    when "9"; quitshop
    else; unrecogized
    end
  end

  def order_items
    puts "Type in the ID no. of what you would like to order"
    item = choice
    puts "#{item[:dish]}\nHow many servings of #{item[:dish]} would you like to order?"
    gets.chomp.to_i.times { @order.order_item(item) }
    input
  end

  private

  def showm
    @menu.show_menu
    input
  end

  def place_order
    puts "Do you wish to place your order? (Type no to make changes)"
    ans = gets.chomp
    input if ans.empty?
    ans[0].casecmp("n").zero? ? input : @order.place
    quitshop
  end

  def look_at_order
    @order.order_view
    puts "Total cost;  £#{@order.order_total}"
    input
  end

  def quitshop
    puts "Thankyou!"
    exit
  end

  def unrecogized
    puts "Unrecognized input! Try again."
    input
  end

  def choice
    id = gets.chomp
    @menu.choose((id[-1]).to_i)
  end

end
