require_relative 'checkout'
class Menu

  attr_reader :choice

  def initialize(checkout_class = Checkout)
    @checkout = checkout_class
    @menu = [
      {:name => "Cheeseburger", :price => 11.95},
      {:name => "Pancakes", :price => 9.00},
      {:name => "New Mexican Omelet", :price => 9.10},
      {:name => "California Chicken Wrap", :price => 11.50},
      {:name => "Sunday Brunch", :price => 15.45},
      {:name => "Water", :price => 1.25}
    ]
  end

  def print_menu
    index = 1
    @menu.each do |hash|
      puts "#{index}: #{hash[:name]} - £#{sprintf("%.2f", hash[:price])}"
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      index += 1
    end
  end

  def decision
    puts "Would you like to order from us?: [y/n]"
    @choice = gets.chomp
    fail "User is not interested in ordering" if @choice == "n"
    @cart = @checkout.new
    @items = []
    add_items
  end

  def add_items
    puts "Great!"
    puts "What would you like? Enter the number of the item you desire:"
    loop do
      print_menu
      input = gets.chomp.to_i
      if input == 0
        @cart.place_order(@items)
        break
      elsif input > @menu.length || input < 0
        puts "Invalid menu number, try again!"
      else
        @items.push(@menu[input-1])
        puts "Anything else? Type '0' to place the order!"
      end
    end
  end

end
