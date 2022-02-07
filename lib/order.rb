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
      puts "#{dish} #{price}"
    end
    @mymenu  
  end  

  def open_order
    @order_items = {} 
    @mymenu.each do |dish, _price|  # use _price because price isn't used
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

  def check_order
    @order_items.each do |dish, qty|
      if qty.positive?   # rubocop doesn't like qty > 0
        price = mymenu[dish.to_sym]
        sub_total = qty * price
        puts "You have ordered #{dish} x#{qty} at £#{price} each"
        @total += sub_total
      end  
    end 
    puts "The total cosr of your order is £#{@total}"
  end   

end 
