require_relative 'menu'


class Order

  attr_reader :order
  def initialize (menu_class = Menu)
    @menu = menu_class.new
    @order = []
  end
  # def add_item choice
  #   order << [choice,view_menu[choice]] if view_menu.key?(choice)
  # end
  def view_menu
    @menu.view_menu
  end


  def add_item_qty choice, qty
   raise "item not available" if !view_menu.key?(choice)
    order << [choice,view_menu[choice],qty] # if view_menu.key?(choice)
  end




end

#  harry=Order.new
# # # harry.add_item("diet coke")
# # #  harry.add_item("diet coke")
# # #  harry.add_item("coke")

#  harry.add_item_qty("caviar", 8)
#   harry.add_item_qty("caviar", 0)
#    harry.order
# p harry.get_total
# p harry.basket_summary