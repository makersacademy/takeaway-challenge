require_relative 'menu'
require_relative 'order_item'
class Order 

attr_reader  :dishes_ordered, :menu, :total

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
    @dishes_ordered.push(item)
    else
        raise "Dish doesn't exist"
    end

end

def place_order
    raise "Total is incorrect" if check == false 
    puts "Order Succesful" if check == true #placeholder for sending text message
end

def get_total
    @total
end


private

def check #iterate through dishes_ordered and get subtotal, then sum all the subtotal and compare with total
    all_subtotal =0
    @dishes_ordered.each do |item|
        all_subtotal +=  item.sub_total
    end
    

    all_subtotal == get_total ? true : false
end



end