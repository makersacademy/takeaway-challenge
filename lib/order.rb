require_relative('Menu')
require_relative('Messages')

class Order

    attr_reader :order_list, :item_count, :menu, :total_order_sum, :total_item_count

    def initialize()
        @order_list = []
        @item_count = 0
        @menu = Menu.new
        @total_order_sum = 0
        @total_item_count = 0
    end

    def pick_item(selection)
        item = @menu.menu_items[selection]
        add_item(item)
    end

    def add_item(item)
        @order_list.push(item)
        @item_count += 1
    end

    def list_order
        @order_list
    end

    def generate_total_order_sum
        @total_order_sum = @order_list.sum { |x| x[:price] }
    end

    def delivery_message
        t = Time.now + 1*60*60
        delivery_time = t.strftime("%H:%M")
        "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    end

    def send_confirmation_text
        body = delivery_message
        t = Twilio_text.new
        t.send_message(body)
    end
    
    def total_order_text
        generate_total_order_sum
        delivery_messsage = order_time_message
        "Total Order #{@item_count} items = £#{@total_order_sum}"
    end
    
    def order_confirmation
        confirmation_list = []
        item_sub_total = @order_list.group_by(&:itself).map{|k, v| k.merge(count: v.length)} 
        item_sub_total.each do |x|
            sub_total = x[:price].to_i * x[:count].to_i
            confirmation_list << "#{x[:count]} x #{x[:name]} £#{sub_total}"
        end
        confirmation_list
    end

end