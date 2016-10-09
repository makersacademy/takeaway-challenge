require_relative 'restaurant'
require_relative 'takeaway'


class Menu

  attr_reader :menu_list

  def initialize
    @menu_list = [{name: "Beef Dipped in Vinegar", price: 5},
    {name: "Classic Silky Vietnamese Sausage", price: 6},
    {name: "Fermented Pork Sausage", price: 4},
    {name: "Fried Spring (Imperial) Rolls", price: 5},
    {name: "Grilled Sugarcane Shrimp", price: 7},
    {name: "Shredded Pork Salad Rolls", price: 8},
    {name:  "Toasted Dried Squid", price: 9},
    {name:  "Salad Rolls Rice Paper", price: 3}]
  end

  def pretty_print_menu
    count = 1
    puts "Welcome to Vietnoms!"
    @menu_list.each do |item|
    puts "#{count} #{item[:name]} - £#{item[:price].to_i}"
    count += 1
    end
  end

end
