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
    select_options = { 1 => "See our menu",
                       2 => "Add item to basket",
                       3 => "Check your order total",
                       4 => "Confirm order",
                       5 => "Discard order" }

    select_options.each { |(item, value)| puts "#{item}. #{value}\n" }
    @option = gets.chomp.to_i
  end

  def user_order
    case @option
    when 1
      @menu.see_menu
      user_options
    when 2
      add_items
    when 3
      view_basket
    when 4
      send_text
    when 5
      exit
    end
  end

  def add_items
    puts "Enter 1-6 to add items to your basket or x to exit"
    @option = gets.chomp
    while @option != "x"
      @menu.range.each do |key, value|
        if key == @option.to_i
          @basket << value
        end
      end
      puts "Item added to basket!"
      @option = gets.chomp
    end
    user_options
  end

  def view_basket
    puts "Your basket contains: #{@basket}"
    user_options
  end

  def send_text
    puts "Thank you for your order!"
  end
end

# menu = Menu.new
# takeaway = Takeaway.new(menu)

# takeaway.user_options
# takeaway.user_order
# takeaway.add_items
# takeaway.menu.range
# takeaway.view_basket
# takeaway.send_text
