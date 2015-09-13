require_relative 'menu.rb'
require_relative 'text_sender.rb'


class Customer

  attr_reader :order, :menu, :text_sender
  attr_writer :total

  def initialize(menu = Menu.new)
    @menu = menu.dishes
    @order = {}
    @total = 0
    @text_sender = text_sender
  end

  def display_menu
   menu.each { |key, value| "#{key}, £#{value}" }
  end

  def place_order(dish, quantity)
    fail "This dish is not on the menu" unless menu.key?(dish)
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
      fail "Payment does not match total" if (amount != total_cost)
      Delivery.new.text_customer
  end

end
