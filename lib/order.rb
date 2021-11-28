require_relative 'menu'

class Order

  attr_reader :order, :total, :menu

  def initialize
    @menu = Menu.new.print_menu
    @order = []
  end

  def add_items(item)
    @order << @menu[item - 1]
  end

  def check_order
    @total = 0
    @order.each do |item|
      item.each do |item, price|
        puts "#{item}: £#{price}"
        @total += price
      end
    end
    puts "Total: £#{@total}"
  end

  def submit_and_confirm
    raise "Your order is empty" if @order.empty?
    time = Time.new
    puts "Thank you! Your order was placed and will be delivered before #{time.hour + 1}:#{time.min}"
  end
end 
