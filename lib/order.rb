require_relative 'menu'

class Orders

attr_reader :order

  def initialize

    @order = []


  end

  def add_menu_item_to_order(item, number=1)
    @order << [item, number, number *item.price]
  end

  def total_dishes
  total_dishes = []
  order.each do |item|
    total_dishes <<item[1]
  end
  total_dishes.inject(:+)
  end

  def show_order
    puts "Your Order"
    @order.each do |item|

    end
  end

  def total
    order
    total = []
    order.each do |item|
      total<<item[2]
    end
    puts "Order Total"
    total_order = total.inject(:+)
    puts "£" + total_order.to_s
    total_order
  end

  def correct(customer_happy)
   fail "Order Total incorrect" if customer_happy != "Yes"

   puts "Thank you for your order"
   puts "Please enter your phone number"
   puts "and we will send you a message"
   puts "telling you when your delivery"
   puts "is due"
  end





end

# curry = Menu_item.new("Curry",5)
# burger = Menu_item.new("Burger",6)
# p curry
# p burger
# menu = Menu.new
# p menu
# menu.add_item(curry)
# menu.add_item(burger)
# p menu
# order = Orders.new
# p order
# order.add_menu_item_to_order(curry)
# order.add_menu_item_to_order(burger)
# puts order
#
# puts
# p order.show_order
# puts
# puts order.total
# order.correct("Yes")
