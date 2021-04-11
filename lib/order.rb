require_relative 'menu'

class Order
  attr_reader :order_placed, :balance

  def initialize
    @order_placed = []
    @balance = 0
  end

  def add(request)
    fail 'That item is not available' if check_menu(request) == false

    @order_placed << request
    add_to_balance(request)
  end

  def check_menu(request)
    menu = Menu.new
    menu.see_menu.include? request
  end

  def add_to_balance(request)
    menu = Menu.new
    @balance += menu.available_dishes[request]
  end

  def check_balance
    menu = Menu.new
    statement = ""
    @order_placed.each do |item| 
      statement += "#{item}: #{menu.available_dishes[item]}, " 
    end
    p "#{statement}Total: #{balance}"
  end
  
end
