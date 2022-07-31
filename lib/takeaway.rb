require_relative 'menu'
require 'date'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    @menu.format_menu
  end

  def preview_order(*items)
    puts order_header
    puts construct_order(items)
    puts "Your order comes to: £#{calculate_price(items)}"
    puts 'ready to order? Type yes to confirm, or no to quit'

    answer = gets.chomp

    complete_order(answer)
    puts order_footer
    
  end

  private

  def complete_order(answer)
    if answer.downcase == 'yes'
      puts "Order placed: #{Time.now.strftime("%d/%m/%Y %H:%M")}. Order should arrive within 30 mins!"
    else
      return
    end
  end 


  def order_header
    'Your order:'
  end

  def order_footer
    'Thank you for your custom. See you again!'
  end

  def calculate_price(order)
    order.map do |i|
    
      @menu.menu.select { |hash| hash[:item] == i }
    end.flatten.map { |x| x[:price] }.inject(:+)
  end

  def construct_order(order)
    x = order.map do |i|
    
      @menu.menu.select { |hash| hash[:item] == i }
    end.flatten 
    x.each_with_index do |hash, index| 
      puts "#{index + 1}. #{hash[:item]} ~ £#{hash[:price]}"
    end
  end

end
