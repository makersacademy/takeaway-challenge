require_relative 'menu'
require 'dotenv'
Dotenv.load

class Order
  attr_reader :selection, :menu_list, :total, :bill_me

  def initialize
    @menu = Menu.new
    @selection = []
    @total = []
  end

  def add_to_order(dish, quantity)
    @selection << { dish => quantity }
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
    @bill_me = @total.inject(0, :+)
  end

  def display_total
    raise "Ooops! Error! Try again!" if @bill_me != @total.inject(0, :+)
    p "Your total for this order is £#{@bill_me}."
  end
end
