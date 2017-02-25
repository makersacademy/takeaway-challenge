require 'json'

class Resturant

  def initialize(menu = Menu, order_template = Order, printer = Printer)
    @menu = menu.new.dishes
    @order_template = order_template
    @printer = printer.new
  end

  def show_menu
    JSON.pretty_generate menu
  end

  def add_to_cart(dish_info)
    fail "Please provide a hash with ':name' and ':quantity' as keys" if dish_info[:name] == nil || dish_info[:quantity] == nil
    @current_order ||= order_template.new
    item = menu.select{|item| item.has_value?(dish_info[:name])}.first
    fail "Sorry, chosen item not on the menu" if item == nil
    current_order.add({name: item[:name],price: item[:price], quantity: dish_info[:quantity]})
  end

  def confirm_order(cust_total)
    fail "Sorry, Please place an order first" if current_order == nil
    total = current_order.calculate_total
      if cust_total == total
        print_bill
      else
       fail "Discrepency in bill amount: Please print bill to verify your order and total"
     end
  end

  def print_bill
    fail "Sorry, Please place an order first" if current_order == nil
    printer.display_bill(current_order.details, current_order.calculate_total)
  end

  private
  attr_reader :order_template, :current_order, :menu, :printer
end
