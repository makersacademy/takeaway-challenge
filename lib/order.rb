require_relative 'menu'
require_relative 'order_item'
require_relative 'send_text'
class Order 

attr_reader  :dishes_ordered, :menu, :total, :text_message

    def initialize(menu = Menu.new, total = 0, text_message = TwilioClass.new, order_item = OrderItem)
        @dishes_ordered = []
        @total = total
        @menu = menu
        @text_message = text_message
        @order_item = order_item
    end

    def display_menu
        menu.display
    end

    def add(dish_id, quantity)
        if menu.price_exist(dish_id)
            sub_total = menu.get_price(dish_id) * quantity
            item = @order_item.new(dish_id, quantity, sub_total)
            @total += sub_total
            @dishes_ordered.push(item)
        else
            raise "Dish doesn't exist"
        end
    end

    def place_order
        raise "Total is incorrect" if check == false 
        if send_text == true
             "Text successfully sent" 
        else
            "Text failed to send"
        end  
    end


private

    def check #iterate through dishes_ordered and get subtotal, then sum all the subtotal and compare with total
        all_subtotal =0
            @dishes_ordered.each do |item|
            all_subtotal +=  item.sub_total
        end
    all_subtotal == @total ? true : false
    end

    def send_text
        @text_message.send
    end



end