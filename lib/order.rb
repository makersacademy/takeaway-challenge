require_relative 'menu'
# require_relative 'dish'

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
  
  #def show_menu
  #  @mymenu = Menu.new
  #  @mymenu = mymenu.load
  #  puts "we got here"
  #  puts @mymenu
  #  @mymenu = mymenu.show_menu2
  #  puts @mymenu
  #end  

  def open_order
    @order_items = {}
    @mymenu.each do |dish, price|
      @order_items[dish.to_sym] = 0
    end  
    puts @order_items
    return @order_items
  end  

  
  def add_dish(dish, qty = 1)

  end  

end 
