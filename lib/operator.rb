require_relative 'menu.rb'
require_relative 'text.rb'

class Operator

  def initialize(menu = Menu.new, text = Text.new)
    @menu = menu
    @text = text
    #@current_text = @text.new_message
    @price = 0
  end

  def check_new_messages
    @current_text = @text.new_message
  end

  def order_online(input)
    @current_text = input
  end

  def send_menu
    # send(@menu.food)
    @text.send_text(@menu.food)
  end

  def sort_order(current_text)
    item_quantity = seperate_text(current_text)
    order_information = meal_quantity(item_quantity)
    @price = @menu.create_receipt(order_information)
    # confirmation_message(order_information)
    order_information
  end

  def confirmation_message(order_information)
    message = "Thank you for placing your order of:\n"
    message = food_list(order_information,message)
    message = message + "Total cost: £#{@price}"
    # send(message)
    message
  end

  def send(message)
    @text.send_text(message)
  end

  # def action
  #   send(@menu.food) if request_menu?
  #   sort_order(@current_text) unless request_menu?
  # end

  private

  # def request_menu?
  #   @current_text.include? 'menu'
  # end


  def seperate_text(order)
    item_quantity = []
    items = order.split(",")
    items.each do |x|
      item_quantity << x.split(" ")
    end
    item_quantity
  end

  def meal_quantity(item_quantity)
    order_information = {}
    item_quantity.each do |x|
      if x.length == 1
        order_information[x[0].to_sym] = 1
      else
        order_information[x[0].to_sym] = x[1].to_i
      end
    end
    order_information
  end

  def food_list(order_information,message)
    order_information.each do |food,quantity|
      message = message + "#{quantity}x #{food}\n"
    end
    message
  end

end
