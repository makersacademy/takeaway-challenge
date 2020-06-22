require_relative 'sms'
class Takeaway
  def initialize(menu:, order: nil, sms:)
    @menu = menu
    @order = order
    @sms = sms
  end

  def print_menu
    menu.print
  end

  def place_order(dishes)
    puts "To place your order, confirm what you have selected."
    input = gets.chomp
    dishes.each do |dish, quan|
      order.add(dish, quan)
    end
    order.total
  end
  def send_text
    sms.send_text
  end

  attr_reader :menu, :order, :sms


end
