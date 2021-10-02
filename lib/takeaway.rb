require_relative "menu"

class Takeaway
  attr_accessor :menu, :option, :basket, :total

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @total = 0
  end

  def user_options
    puts "\n Choose an option from the below \n"
    select_options = {
      1 => "See our menu",
      2 => "Add item to basket",
      3 => "Check your order total",
      4 => "Confirm order",
      5 => "Discard order",
    }
    select_options.each do |(item, value)|
    "#{item}. #{value}\n"
    end
    @option = gets.chomp.to_i
  end

  def user_order
    case @option
    when 1
      @menu.see_menu
      user_options
    when 2
      add_items
      user_options
    end
  end

  def add_items
    puts "Enter 1-6 to add items to your basket or x to exit"
    @option = gets.chomp
    while @option != "x"
      @menu.range.each do |k, v|
        if @option == k 
          @basket.push(v) 
        end
        @basket
      end
      puts "Item added to basket!"
      @option = gets.chomp
     end
     @basket
  end
    
end
