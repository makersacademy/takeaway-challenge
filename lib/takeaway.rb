require_relative 'menu'
require_relative 'textmessage'

class Takeaway

  attr_reader :order, :order_total

  def initialize
    @menu = Menu.new
    @order = []
    @order_total = 0
  end

  def view_menu
    @menu.dishes
  end

  def add_to_order(dish)
    @order << dish
  end

  def calculated_total

    @order.each do |dish|
      @order_total += @menu.dishes[dish]
    end
    @order_total
  end

  def confirm_order(total)
    raise("That is not the correct total!") if total != @order_total
    text = TextMessage.new
    text.send_text
  end

end
