require_relative 'menu.rb'
require_relative 'text.rb'

class Order
  attr_reader :menu, :order
  def initialize(order = [], menu = Menu.new, text = Text.new )
    @order = order
    @menu = menu
    @text = text
  end

  def show_menu
    @menu.see_menu
  end

  def select_dish(dish)
    @order << { "Dish" => dish, "Price" => @menu.menu.fetch(dish) }
  end

  def total
    sum = 0
    @order.each { |item| sum += item["Price"] }
    sum
  end

  def see_order
    puts "Your order:"
    @order.each { |item| puts "1 x #{item["Dish"]}...£#{"%.2f" % item["Price"]}" }
    puts "Total = £#{"%.2f" % total}"
  end

  def text_confirmation(number)
    @text.send_sms(total, number)
  end 
end
