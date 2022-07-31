require_relative 'order'
require_relative 'takeaway'
require_relative 'send_sms'

class Receipt

  attr_reader :item_subtotals, :total_price


  def initialize
    @item_subtotals = []
    @order_string = ""
    @total_price = 0
  end

  include Text



  def receipt(order)
    order.current_order.each do |item, quantity|

      item_total = menu_item_pricer(item)
      total = price_calculation(quantity, item_total)
      @total_price += total

      @item_subtotals << "#{item} x#{quantity} : £#{total}"
    end
  end



  def confirmation_msg
    order_output
    send_sms(@order_string, @total_price)
  end


  def check_total(value)
    return "The total is correct." if @total_price.round(2) == value
    raise "Your calculated total doesn't match the total."
  end






  private

  def order_output
    order_string = @item_subtotals.each do |item|
      @order_string = @order_string + item + "\n"
    end
    return @order_string
  end

  def price_calculation(quantity, price)
    (quantity * price).round(2)
  end


  def menu_item_pricer(item, menu = Menu.new)
    menu.menu.each do |order_hash|
      order_hash.each do |food_item, price|
        if food_item == item
          return price
        end
      end
    end
  end



end
