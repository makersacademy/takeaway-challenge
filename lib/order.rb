require_relative "takeaway"

class Order
  attr_reader :order_list, :menu

  def initialize
    @order_list = []
    @menu = Takeaway.new.menu_list
  end

  def make_order
    loop do
      puts "Here is the menu: #{@menu}"
      puts "What would you like to order? "
      selection = gets.chomp
        if selection.empty?
          puts "Here is your order: #{order_list}" 
          break
        else 
          add_item(selection)
        end  
    end
  end

  def add_item(item)
    @menu.each do |k, _|
      if item == k
        @order_list << k
        puts "Here is your order: #{@order_list}" 
      end
    end
  end
end
