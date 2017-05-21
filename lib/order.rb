require_relative 'menu'
require_relative 'confirmation'
require 'dotenv/load'
Dotenv.load('twilio.env')

class Order
  attr_reader :selection, :menu_list, :feed_me, :confirmation

  def initialize
    @menu = Menu.new
    @selection = []
    @total = []
  end

  def make_choice
    p "Please make a selection from the Menu."
    p "Type: order.add_to_order(food, quantity), with the food in speech marks."
    @menu.list_menu
    p "When order is complete, type order.confirm_order"
  end

  def add_to_order(dish, quantity)
    @selection << { dish => quantity }
    return "#{quantity}x #{dish} has been added to your order."
  end

  def calculate_price
    selection.each do |choice|
      choice.each do |item, qty|
        @price = @menu.menu_list[item]
        @total << @price *= qty
      end
    end
    @total
  end

  def calculate_total
    calculate_price
    @bill_me = @total.inject(0, :+)
  end

  def display_total
    calculate_total
    raise "Ooops! Error! Try again!" if @bill_me != @total.inject(0, :+)
    p "If happy with this order, type order.feed_me.complete_order"
    p "Your total for this order is £#{@bill_me}."
  end

  def confirm_order(feed_me = Confirmation.new)
    selection.each do |item|
      p "#{item}"
    end
    display_total
    @feed_me = feed_me
  end
end
