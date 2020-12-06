require_relative './menu.rb'
require_relative './message_sender.rb'
require 'twilio-ruby'
class Restaurant
  attr_reader :menu, :message_sender

  def initialize(menu = Menu.new, message_sender = MessageSender.new)
    @menu = menu
    @message_sender = message_sender
  end

  def get_menu
    @menu.print_menu
  end

  def take_order(order)
    total_price = 0
    order.order_list.each do |dish_name|
      fail "This dish does not exist" if on_the_menu?(dish_name) == false 

      total_price += get_price_by_dish_name(dish_name)
    end
    return total_price 
  end

  def confirm_order(phone_num)
    @message_sender.send_message(phone_num)
  end

private
  def on_the_menu?(dish_name)
    @menu.dishes_list.each do |dish|
      if dish.name == dish_name
        return true
      end
    end
    return false 
  end  

  def get_price_by_dish_name(dish_name)
    @menu.dishes_list.each do |dish|
      if dish.name == dish_name
        return dish.price.to_i
        
      end
    end
  end
end
