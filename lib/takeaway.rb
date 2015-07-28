require_relative 'text_sender'

class Takeaway
  def initialize
    @menu = { "pizza" => 8, "salad" => 6, "fish and chips" => 10 }
    @order = []
    @price_list = []
    @final_price = 0
  end

  def place_order item
    if @menu.has_key?(item)
      @order.push(item)
    else
      fail 'Item not found in menu'
    end
  end

  def calculate_total
    order_temp = @order
    while order_temp.length > 0
      if @menu.include?(order_temp[0])
        @price_list << @menu[order_temp[0]]
        order_temp = order_temp[1..-1]
      else
        order_temp = order_temp[1..-1]
      end
    end
    price_list_temp = @price_list
    total_price = 0
    while price_list_temp.length > 0
      total_price = total_price + price_list_temp[0]
      price_list_temp = price_list_temp[1..-1]
    end
    @final_price = total_price
    Texter.new.send_message
    return @final_price
  end

  def show_menu
    @menu
  end
end
