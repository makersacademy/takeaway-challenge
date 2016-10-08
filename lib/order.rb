require_relative 'menu'

class Order

  attr_reader :menu, :selection, :order_price, :order_total

  def initialize
    @menu = Menu.new
    @selection = []
    @order_price = 0
  end

  def show_menu
    @menu.see_menu
  end

  def select_item(item_number)
    @selection << @menu.menu[item_number - 1]
  end

  def show_order
    count = 0
    @selection.each {|item| count += 1; puts "#{count}. #{item[:name]} : £#{item[:price]}" }
  end

  def total_price
    @order_price = @selection.map{|item| item[:price]}.inject(:+).round(2)
    puts "Your order total is £#{@order_price}"
  end

  def order_summary
    show_order
    total_price
  end
end
