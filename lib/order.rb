require './lib/menu.rb'
class Order 

  attr_reader :order_form, :menu, :total

  def initialize 
    @order_form = Hash.new
    @menu = Menu.new.menu_list
    @items = []
    @total = 0
  end 

  def view_menu
    menu.view
  end 

  def add_item(dish, quantity)
    raise 'dish not on menu' if check_item(dish) == false

    order_form[dish] = quantity
    quantity.times do
      @items << dish
    end
    "#{quantity} x #{dish} added to your order"
  end

  def check_item(dish)
    menu.key?(dish)
  end

  def get_total 
    @menu.each do |k, v|
      @items.each do |i|
        if i == k 
          @total += v
        end 
      end 
    end
    @total
  end 
end 
