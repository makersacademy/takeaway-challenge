require_relative 'menu'

class Order

  attr_accessor :mymenu, :order_items, :total

  def initialize
    @order_items = {}
    @total = 0
    @mymenu = Menu.new
  end 
  
  def show_menu
    @mymenu = mymenu.load
    @mymenu.each do |dish, price|
      puts "#{dish.to_s} #{price}"
    end
    @mymenu  
  end  

  def open_order
    @order_items = {} 
    @mymenu.each do |dish, price|
      @order_items[dish.to_sym] = 0
    end  
    puts @order_items
    return @order_items
  end  

  
  def add_dish(dish, qty = 1)
    q = @order_items[dish.to_sym]
    q += qty
    @order_items[dish.to_sym] = q
  end  

end 
