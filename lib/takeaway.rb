require_relative 'menu'
class Takeaway
  attr_reader :list, :subtotal, :orders, :total

  def initialize
    @orders = {}
    @menu = Menu.new
    @total = 0
    @subtotal = 0
  end

  def show_menu(menu)
    @menu = menu
    @menu.list.each do |name, price|
      puts "Menu: #{name} £#{price}"
    end
  end

  def add_order(dish, quantity)
    if @menu.list.has_key?(dish)
      @orders[dish] = quantity
      @menu.list.slice(dish).each do |food, price|
        @subtotal = price * quantity
        puts "#{quantity} x of #{food} for £#{price} each is £#{subtotal}"
        puts "your total is #{subtotal}"
        @total += @subtotal
        puts "Total: #{total}"
      end
    else
      puts "not available, choose another dish"
    end
  end
end



