require_relative 'send_text'
class Order
    attr_reader :order_list
    def initialize
        @order_list = []
    end

    def add (dish, count = 1)
        item = {}
        item[dish] = count
        @order_list << item
    end

    def total_price
        total = 0
        @order_list.map { |dishes|
            dishes.map { |dish, count|
                total += dish.price * count
            }
        }
        total
    end

    def print_order
        dishes = []
        @order_list.each do |item|
          item.each do |dish, quantity|
            dishes << "#{dish.name}: #{dish.price} * #{quantity} = #{dish.price * quantity}"
          end
        end
        dishes.join(", ")
       
    end

    def place_order(send_text = SendText.new)
        send_text.send
      end
end