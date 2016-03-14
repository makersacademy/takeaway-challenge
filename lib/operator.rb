require_relative 'menu.rb'
require_relative 'text.rb'
require 'time'

class Operator
  DELIVERY_TIME = 1800

  def initialize(menu = Menu.new, text = Text.new)
    @menu = menu
    @text = text
    @current_text = nil
  end

  def check_new_messages
    @current_text = @text.new_message
  end

  def request_menu
    @menu.food
  end

  def action
    raise 'You have not checked the inbox' if @current_text == nil
    send_menu if request_menu?
    automatic unless request_menu?
  end

  def order_online(input)
    @current_text = input
    action
    @current_text
  end

  def send_menu
    @text.send_text(@menu.food)
  end

  def sort_order(current_text)
    item_quantity = seperate_text(current_text)
    order_information = meal_quantity(item_quantity)
  end

  def confirmation_message(order_information)
    price = @menu.create_receipt(order_information)
    message = "Thank you for placing your order of:\n"
    message = food_list(order_information,message)
    message = message + "Total cost: £#{price}\n"
    message = message + "It will arrive at #{arrival_time}"
  end

  def send(message)
    @text.send_text(message)
  end

  def automatic
    order_information = sort_order(@current_text)
    message = confirmation_message(order_information)
    send(message)
  end

  def arrival_time
    time = Time.new
    time += DELIVERY_TIME
    time.strftime("%H:%M")
  end

  private

  def request_menu?
    @current_text.include? 'menu'
  end

  def seperate_text(order)
    item_quantity = []
    items = order.split(",")
    items.each { |x| item_quantity << x.split(" ")}
    item_quantity = item_quantity.flat_map {|x| [x[0].to_sym , x[1].to_i]}
  end

  def meal_quantity(item_quantity)
    order_information = Hash[*item_quantity.flatten]
  end

  def food_list(order_information,message)
    order_information.each do |food,quantity|
      message = message + "#{quantity}x #{food}\n"
    end
    message
  end

end
