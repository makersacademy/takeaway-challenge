require_relative "menu"
class Basket_manager

  attr_reader :current_order

  def initialize
    super
    @current_order = []
    @menu = Menu.new
    @total = 0.00

  end

  def access_menu
    Menu::CHINESE_MENU
  end

  def add_to_basket(dish)
    if access_menu.key?(dish)
      @current_order << access_menu.assoc(dish)
      @total += access_menu.assoc(dish)[1]
      puts "#{dish} x 1 added\n"
    else
      puts "This item does not exist. Select from the menu."
      puts @menu.display_menu #DISPLAY MENU
    end
  end


  def confirm_order
    puts  "Current Order \n"
    puts "----------"
    @total = 0
    @current_order.each{|x|
      puts "#{x[0].center(40)}: £#{'%.2f' % (x[1])} \n"
       @total += x[1]
    }
      puts "Your total is: #{'%.2f' % @total}"
      puts "Proceed to payment"
  end


  def remove_item(removed_item)
    if @current_order.assoc(removed_item)
        item_removed = @current_order.assoc(removed_item)
        @total -= item_removed[1]
        @current_order.delete_at(@current_order.find_index(item_removed))
        puts "The item has been removed from your order."
        #reset the total and then calculate
        @total = 0
        confirm_order
    else
      puts "This item is not a part of your order"
    end
  end
end
