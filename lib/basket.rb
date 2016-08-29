#understands how to hold chosen items
require_relative "main"
require_relative "italian"

class Basket

  attr_reader :current_basket

  def initialize
    @current_basket = {}
  end

  def add_to_cart(item)
    load_menu
    fail "Item not on menu" if !@menu.has_key?(item.to_sym)
    @current_basket[item.to_sym] = @menu[item.to_sym]
  end

  private

  def load_menu
    @menu = Italian.new.menu
  end

end

# attr_reader :current_basket
#
# def initialize
#   @food = Italian
#   @current_basket = {}
# end
#
# def add_to_cart
#   puts "input the number you want and hit enter. To finish, hit enter twice."
#   until @num == "" do
#     @num = (gets.chomp)
#     @item = num_item(@num)
#     item_check(@item)
#   end
# end
#
# def view_basket
#   @current_basket
# end
#
# def item_check(item)
#   if @current_basket.has_key?(item)
#     @current_basket[item] += 1
#   else
#     @current_basket[item] = 1
#   end
# end
#
# def menu_call
#   @food.new.menu
# end
#
# def num_item(num)
#   if num == 0
#     menu_call.keys[(num.to_i)]
#   else
#     menu_call.keys[(num.to_i) -1]
#   end
# end
