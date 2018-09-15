require_relative 'message'
require_relative 'menu'

class Takeaway
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu.current_menu
    @order_total = []
  end

  def order(food, quantity = 1)
    raise "Sorry, we don't have that item." if !@menu.include?(food)
    calculate_total(food, quantity)
    "#{quantity}x - #{food.capitalize} added to basket. Your current total is: #{order_total}"
  end

  
  def order_confirmation(message = Message.new, time = (Time.now + 3600))
    message.send_text("Spasibo! Your total is #{order_total}. It will be there by #{time_format(time)}.")
    "Spacibo! You will receive a text soon confirming your order."
  end
  
  private
  
  def order_total
    "£#{@order_total.sum.round(2)}"
  end
  
  def calculate_total(food_choice, quantity)
    @menu.each do |food, price|
      if food_choice == food
        @order_total << (price * quantity)
      end
    end
  end

  def time_format(time)
    time.strftime("%H:%M")
  end
end
