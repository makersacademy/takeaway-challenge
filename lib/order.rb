require_relative 'menu'

class Order
  attr_reader :basket, :total

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @total = 0
  end

  def show_menu
    puts @menu.print_menu
  end

  def add_item(item)
    raise "This item doesn't exist!" if check_if_not_in_menu(item)

    @basket << item
    add_to_total(item)
  end 
  
  def show_order
    raise "Your basket is empty." if @basket.empty?

    @basket.each do |item|
      puts "#{item}, £#{@menu.items[item]}"
    end
    
    print_total
  end

  def place_order
    raise "Can't place an order with an empty basket!" if @basket.empty?

    "Thank you! Your order was placed and will arrive no later than #{(Time.now + 3600).strftime("%k:%M")}."
  end

  private
  def check_if_not_in_menu(item)
    !@menu.items.include?(item)
  end

  def add_to_total(item)
    @total += @menu.items[item]
  end

  def print_total
    puts "---------------------"
    puts "Your total is: £#{@total}."
  end
end
