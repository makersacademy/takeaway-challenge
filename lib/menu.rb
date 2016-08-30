require './lib/order'
require './lib/total'

class Menu
  attr_reader :menu_card
  def initialize
    @menu_card = {
      "naan" => 1,
      "biryani" => 4,
      "dosa" => 3,
      "masala papad" => 3,
      "chicken soup" => 2,
      "mushroom soup" => 2,
      "chicken" => 3,
      "fish" => 2,
      "pork" => 3}.freeze
  end
  def show_menu
    puts "The menu for Apoorva the Dhaba"
    menu_card = @menu_card
    pretty_print_menu
  end

  def pretty_print_menu
    menu_card.each do |key,value|
      puts "#{key} : #{value}£"
    end
  end

  def has_item?(item)
    menu_card.key?(item)
  end

  private :pretty_print_menu
end
