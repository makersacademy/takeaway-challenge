require_relative './order.rb'
require_relative './order_item.rb'

class TakeawayApp

  attr_reader :order

  $menu = [{ :dish => "Chicken Korma", :price => 8 }, { :dish => "Lamb Balti", :price => 9 }]
  def show_dishes
    menu = [{ :dish => "Chicken Korma", :price => 8 }, { :dish => "Lamb Balti", :price => 9 }]
    menu.each_with_index { |menu_item, index| puts "#{index + 1}. #{menu_item[:dish]} £#{menu_item[:price]}" }
  end

  def prompt_order
    print "Please enter the dish number followed by a space followed by the quantity you would like to order."
    puts " When you are finished please press enter twice."
  end

  def receive_order(order)
    @order = order
    # prompt_order
    # order_item = STDIN.gets.gsub(/\n/,"")
    # while !order_item.empty?
    #   @order << { :dish_number => order_item.split[0], :quantity => order_item.split[1] }
    #   order_item = STDIN.gets.gsub(/\n/,"")
    # end
  end

end
