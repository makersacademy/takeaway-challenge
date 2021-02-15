require_relative 'menu'
require_relative 'text'

class Order
  attr_reader :order_list, :bill, :menu, :bill_check

  def initialize
    @order_list = []
    @bill = 0
    @bill_check = []
    @menu = Menu.new.list
  end

  def add(dish)
    if @menu.include?(dish)
      amount = @menu[dish]
      total(amount)
    else
      raise "This dish is unavailable, please select a dish from the menu"
    end
    @order_list << dish
  end

  def check_order?
    @order_list.each do |dish|
      @menu.include?(dish) ? @bill_check << @menu[dish] : false
    end
    sum = 0
    @bill_check.each do |dish|
      sum += dish
    end
    sum == @bill
  end

  def place_order
    text = Text.new
    text.send_text
  end

  private
  def total(amount)
    @bill += amount
  end

end
