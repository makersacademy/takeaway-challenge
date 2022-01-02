require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class Takeaway
  attr_reader :menu, :order, :sms

  def initialize(menu, sms)
    @menu = menu
    @order = Order.new(menu)
    @sms = sms
  end

  def display_menu
    puts @menu.print_menu
  end

  def build_order(item, quantity)
    @order.add_item(item, quantity)
    @order.basket
  end
  
  def display_order
    display_items
    display_total
  end

  def confirm_order
    @sms.send_text
    thank_you_msg
  end

  private

  def display_items
    @order.basket.map do |item, quantity|
      puts "* #{quantity} x #{item} .. £#{sprintf('%.2f', @order.calculate_quantity_total(item))}"
    end
  end

  def display_total
    puts "* Total ..... £#{sprintf('%.2f', @order.calculate_total)}"
  end

  def thank_you_msg
    puts "Thank you for your order. You will be receiving a confirmation SMS shortly."
    puts "Enjoy your meal!"
  end

end
