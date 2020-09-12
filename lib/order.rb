require_relative 'menu'
require_relative 'order_item'
class Order 

attr_reader :dishes_ordered, :total, :menu

def initialize(menu = Menu.new, total = 0)
@dishes_ordered = []
@total = total
@menu = menu

end


def display_menu
menu.display
end

def add(dish_id, quantity)
    if menu.menu_price.has_key?(dish_id)
    sub_total = menu.menu_price[dish_id] * quantity
    item = OrderItem.new(dish_id, quantity, sub_total)
    @total += sub_total
    @dishes_ordered << item
    else
        puts "Dish doesn't exist"
    end

end

def place_order
check
end

private

def check #iterate through dishes_ordered and get subtotal, then sum all the subtotal and compare with total

end



end