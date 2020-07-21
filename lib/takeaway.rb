# frozen_string_literal: true

require_relative 'order.rb'
require_relative 'text_message.rb'

class Takeaway
  attr_reader :order, :menu
  def initialize(order)
    @order = order
    @menu = @order.menu
    
  end

  def print_menu
    print menu.print_items
  end

  def order_process(dishes)
    place_order(dishes)
    print order.basket_total
  end

  #def text
  #  send_text('Thankyou', ['+447590606244'])
  #end
  private

  def place_order(dishes)
    dishes.each_slice(2) do |dish, quantity|
      order.add_item(dish, quantity)
    end
   end
end


