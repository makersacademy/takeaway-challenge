
class Takeaway
  attr_reader :menu, :show_menu, :dish, :subtotal, :orders
  def initialize
    @menu = {}
    @orders = {}
  end

  def dish(name, price)
      @menu[name] = price
  end

  def show_menu
    @menu.each do |name, price|
    puts "Menu: #{name} £#{price}"
    end
  end
def select_order(dish, quantity)
    if @menu.has_key?(dish)
    @orders[dish] = quantity
      @menu.each do |name, price|
      if name == dish
        @subtotal = price * quantity 
      end
        puts "#{quantity} x of #{name} for £#{price} each is £#{subtotal}"
      puts "your total is #{subtotal}"
      end
      #subtotal is stored in variabl instance of @subtotal
    else
    puts "not available, choose another dish"
    end

  end
end
# class Menu  

#   attr_reader :menu, :orders, :subtotal
#   def initialize
#     @menu = {
#       "Pasta" => 5,
#       "Pizza" => 7,
#       "Fish and Chips" => 10,
#       "Soup" => 3
#     }
#     @orders = []
#     @total = []
#   end

#   def show_menu
#     @menu.each do |food, price|
#       puts "#{food} £#{price}"
#     end
#   end

#   def select_order(order, quantity)
#     if @menu.has_key?(order)
#     @orders << [order, quantity]
#     @menu.slice(order).each do |food, price|
#       @subtotal = price * quantity
#       puts "#{quantity} x of #{food} for £#{price} each is £#{subtotal}"
# puts "your total is #{subtotal}"
#     end
#   else
#     puts "not available, choose another dish"
#   end
#   end

#   def calculate_total
#     @orders.each do |food, quantity|
#       @total = quantity + quantity
#   end
# end
# end
