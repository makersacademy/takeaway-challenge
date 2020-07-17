require_relative './menu'
require_relative './sms'

class Order
  attr_reader :current_order

  def initialize(menu: Menu.new)
    @menu = menu.options
    @menu_display = menu.display
    @current_order = []; @total = 0; @checked = false
  end

  def display
    @menu_display
  end

  def check_total
    receipt(@current_order)
    puts "Total cost is: £#{'%.2f' % @total}".center(50)
    @checked = true
  end

  def select(option, quantity = 1)
    @current_order << new_item(option, quantity)
  end

  def place_order
    @checked ? send_text : "Please place an order after checking your total"
  end

  def reset
    @current_order = []
  end

  private

  def new_item(option, quantity)
    if @menu[option.to_i].nil?
      "Entry not recognised"
    else
      @menu[option.to_i].each_pair do |item, value|
        @item = item; @value = value
        @sum = value * quantity
        @total += @sum
      end
    end
    [@item.capitalize, quantity, @value, @sum].flatten
  end

  def receipt(current_order)
    temp_cost = 0
    current_order.each do |order|
      temp_cost += order[3]
      puts "ITEM  | QUANTITY | PRICE PER | TOTAL: £#{'%.2f' % temp_cost} |".center(50)
      puts "#{order[0]} |  #{order[1]}  |  £#{'%.2f' % order[2]}  |  £#{'%.2f' % order[3]}".center(50)
    end
  end

  def send_text(message_service = Twilio_Class)
    @message_service = message_service
  end

end