class Takeaway
  attr_reader :menu, :option

  def initialize(menu = Menu.new)
    @menu = menu
    @option
  end

  def user_options
    puts "PIZZA SHOP"

    select_options = {
      1 => "See our menu",
      2 => "Add item to basket",
      3 => "Check your order total",
      4 => "Confirm order",
      5 => "Discard order",
    }
    puts "\n Choose an option from the below \n"
    select_options.each do |(item, value)|
      puts "#{item}. #{value}"
    end
    puts "\n"

    @option = gets.chomp.to_i
  end
end
