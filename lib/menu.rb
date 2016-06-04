class Menu
  attr_reader :menu_card
  def initialize
    @menu_card = {
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

  private :pretty_print_menu
end
