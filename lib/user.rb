require_relative './menu.rb'

class User

  attr_accessor :basket, :menu, :price
  DEAFAULT_PRICE = 0

  def initialize
    @menu = Menu.new.show_menu_hash
    @basket = []
    @price = DEAFAULT_PRICE
  end

  def order_selection(order_num)
    keys = @menu.keys
    @price = @menu[keys[order_num.to_i - 1]]
    puts "Thank you number #{order_num} priced at £ #{@price} has been added to your basket"
    @basket <<{ order_num => @price }
    p "#{basket}"
  end

  def display_basket
    puts "The total value of your basket is ....."
  end

end
#
# user = User.new
# user.order_selection


  # def calculating_total_order_price
  #   p "#{@order}"
  # end
  #
  # def accessing_price_of_order
  #   keys = @menu.keys
  #   @price = @menu[keys[order_num - 1]]
  # end





# #
# # def order_error?
# #   menu_items = ["1", "2", "3", "4", "5", "6"]
# #   order_correct = !menu_items.include?(@order)
# #   return 'The number you have input is not an item on the menu' if order_correct == false
# # end
#
# def order_selection
#   order_instructions
#   order = $stdin.gets.chomp
#     while order != 0
#       @order = order.to_i
#     # order_error?
#     accessing_price_of_order
#     @basket << { @order => @price }
#     puts "Thank you number #{@order} priced at £ #{@price} has been added to your bascket"
#     order = $stdin.gets.chomp.to_i
#   end
# end
