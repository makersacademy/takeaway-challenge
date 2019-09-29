require_relative 'menu'

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
    puts order_footer
  end

  private

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
    x.each_with_index { |hash, index| puts "#{index + 1 }. #{hash[:item]} ~ £#{hash[:price]}" }
  end

end
