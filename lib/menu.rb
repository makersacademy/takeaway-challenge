require_relative 'checkout'
class Menu

  attr_reader :choice

  def initialize(checkout = Checkout)
    @checkout = checkout
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
    decision
  end

  private
  def decision
    puts "Would you like to order from us?: [y/n]"
    @choice = gets.chomp
    if @choice == "y"
      checkout = @checkout.new
      checkout.place_order
    else
     puts "We hope to satisfy you on another day mother fucker."
     exit
    end
  end

end
