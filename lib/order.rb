require './lib/menu.rb'
class Order 

    attr_reader :order_form, :menu

  def initialize 
    @order_form = Hash.new(0)
    @menu = Menu.new
  end 

  def view_menu
    menu.view
  end 

  def add_item(dish, quantity)
    order_form[dish.to_sym] = quantity
    "#{quantity} x #{dish} added to your order"
  end 
end 