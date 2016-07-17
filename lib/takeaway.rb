# require_relative 'basket'


class Takeaway

  def initialize(menu:)
    @menu = menu
  end

  def read_menu
    menu.print
  end

  private

  attr_reader :menu

end




#   def initialize(basket = Basket.new, menu = Menu.new)
#       @basket = basket
#       @menu = menu
#   end
#
#   def read_menu
#     @menu.menu_list
#   end
#
#   def add(dish, quantity)
#     fail "Sorry, this is not on the menu" unless on_menu?(dish)
#     @basket.add(dish, quantity)
#     "#{quantity}x #{dish}(s) added to your basket."
#   end
#
#   def basket_summary
#     @basket.basket_summary
#   end
#
#   def total
#     @basket.total
#   end
#
#   private
#
#   def on_menu?(dish)
#     !@menu.dishes[dish.to_sym].nil?
#   end
#
# end
