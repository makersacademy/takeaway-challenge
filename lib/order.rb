require_relative 'takeaway_menu'

class Order

  attr_reader :currnet_order

  def initialize
    @menu = TakeawayMenu.new
    @currnet_order = []
  end


  def add_dish(selected_dish, quantity = 1)
    msg = "Selsected dish is not from our menu"
    raise msg if !menu_includes_dish?(selected_dish)
    @currnet_order << [selected_dish, quantity]
  end

   def show_order
     @currnet_order.each do |order_item|
       print_an_order_item(order_item)
     end
   end


   def claculate_price
    sum = 0
    @currnet_order.each do |order|
      sum += dish_price(order[0]) * order[1]
    end
    sum
  end



  private

  def menu_includes_dish?(selected_dish)
    @menu.from_the_menu?(selected_dish)
  end

  def dish_price(dish)
    @menu.dish_price(dish)
  end


  def print_an_order_item(item)
    space = 11
    puts("#{item[0]}".ljust(space) + "(#{dish_price(item[0])}BD)".ljust(space) + "* #{item[1]}")
  end

end
