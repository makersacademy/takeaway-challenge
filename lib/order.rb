
#Understands how to select dishes
require_relative 'menu'
require_relative 'text'

class Order

  attr_reader :selected_dishes, :total, :menu, :text

  def initialize(menu = Menu.new, text = Text.new)
    @menu = menu
    @text = text
    @selected_dishes = Hash.new(0)
    @total = 0
  end

  def select_dishes(dish, quantity)
    @selected_dishes[dish] += quantity
  end

  def total_price
    selected_dishes.each do |dish, quantity|
      @total += (quantity * (menu.price_check(dish)))
    end
    @total
  end

  def confirm_order
    total == total ? @text.send_text : total_price
    "Thank you, your delivery time will be sent by text shortly"
  end
end
