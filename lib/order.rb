require './lib/menu.rb'
class Order 

    attr_reader :order_form, :menu, :balance

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
    order_form[dish] = quantity
    quantity.times do
      @items << dish
    end
    "#{quantity} x #{dish} added to your order"
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