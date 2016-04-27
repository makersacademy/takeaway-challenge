require_relative 'menu'
require_relative 'sms'

class Takeaway
   attr :menu, :bill, :current_order

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
    @current_order.join(", ")
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

  private

  def selected_items(dish, number=1)
    number.times{ read_menu.select{|k,v| current_order << k if k == dish }}
  end
end
