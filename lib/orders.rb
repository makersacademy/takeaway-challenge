require 'twilio-ruby'
require 'time'

require 'print'
require 'phone'
require 'dishes'

class Order


  def initialize(printer = Printing, phone = Phone, dishes = Dishes)
    @order_list = []
    @phone = phone.new
    @dishes = dishes.new
    @printer = printer.new(@phone, @dishes)
  end

  def print_menu
    @printer.menu
  end

  def order
    loop do
      @printer.enter_id
      order_id = gets.chomp
      break if order_id == 'end'

      order_item = @dishes.select_item(order_id)
      @printer.enter_quantity(order_item)
      order_quantity = gets.chomp
      @order_list.push([order_id, order_quantity])
    end
  end

  def print_order
    @printer.order(@order_list)
  end



  attr_reader :order_list
end
