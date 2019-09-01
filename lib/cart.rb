require_relative 'menu'
require_relative 'sms'

class Cart
  attr_reader :selection, :order_total
	
  def initialize
    @menu = Menu.new
    @selection = []
    @order_total = 0
  end
	
  def view_menu
    @menu.view
  end
	
  def select(*items)
    items.each do |item| 
      @selection << @menu.dish_list[item - 1][:name] 
      @order_total += @menu.dish_list[item - 1][:price]
    end 
  end
	
  def show_cart
    puts "Your order: #{@selection.join(', ')}. Total: £#{@order_total}"
  end
	
  def remove(*items)
    items.each do |item|
      @selection.delete_at(@selection.index(@menu.dish_list[item - 1][:name]))
      @order_total -= @menu.dish_list[item - 1][:price]
    end
  end
	
  def checkout(phone_num)
    SMS.new.send(phone_num)
    puts "Your order has been placed. You should receive SMS confirmation soon"
  end
end
