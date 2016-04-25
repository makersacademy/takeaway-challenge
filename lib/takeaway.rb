require_relative 'menu'
require_relative 'sms'

class Takeaway
   attr_reader :menu, :bill, :current_order

  def initialize(menu=Menu)
    @menu = menu.new
    @current_order = []
    @bill = 0
    @sms = Sms.new
  end

  def read_menu
    @menu.dishes
  end

  def my_order
    @current_order
  end

  def selected_items(dish, number=1)
    number.times{ read_menu.select{|k,v| my_order << k if k == dish }}
  end

  def order(dish, number=1)
    fail "I'm sorry but we do not have #{dish} in the menu" if read_menu[dish] == nil
    selected_items(dish, number)
    number.times{ @bill += read_menu[dish]}
  end

  def total
    "Your total bill amounts to £#{bill}"
  end

  def remove(bad_dish)
    @current_order.each_with_index do |dish,index|
      if dish == bad_dish
        @current_order.delete_at(index)
        break
      end
    end
  end

  def checkout
    shorted_time = (Time.now+3600).strftime("%I:%M%p")
    @sms.send_text("Your order should arrive at #{shorted_time} with the following items: #{my_order}, with a cost of £#{bill}")
    "Message sent"
  end
end
