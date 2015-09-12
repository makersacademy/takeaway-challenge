require_relative 'menu.rb'
require_relative 'text_sender.rb'

class Customer

  attr_reader :order, :menu, :text_sender
  attr_writer :total

  def initialize(menu = Menu.new, text_sender)
    @menu = menu.dishes
    @order = {}
    @total = 0
    @text_sender = text_sender
  end

  def display_menu
   menu.each { |key, value| "#{key}, £#{value}" }
  end

  def place_order(dish, quantity)
    fail "This dish is not on the menu" unless menu.has_key?(dish)
    if order.include?(dish)
      order[dish] += quantity
    else
      order.store(dish, quantity)
    end
    @total += @menu[dish]
  end

  def receipt
    order.map do |dish, quantity|
      "#{dish} x#{quantity}"
    end.join(", ")
  end

  def total_cost
    order.map {|dish, quantity| self.menu[dish] * quantity}.reduce(:+)
  end

  def charge amount
      raise "Payment does not match total" if (amount != total_cost)
      "Thank you for your order, you will recieve a text confirmation shortly."
  end

  def order_dishes phone_number
    self.text_sender.send_text(phone_number, order_message)
  end

  def time_in_an_hour
    (Time.new + 3600).strftime("%H:%M")
  end

  def order_message
    "Thanks! Your order should be delivered by #{time_in_an_hour}"
  end

end
