class Menu

attr_reader :dishes

  def initialize
    @dishes = {
    "chilli chicken ramen" =>12.00,
    "seafood ramen"=>13.00,
    "gyoza"=>6.00,
    "shiitake donburi"=>10.00,
    "chicken katsu curry"=>12.00,
    "prawn raisukaree"=>13.50,
    "warm tofu chilli salad"=>11.00,
    "white chocolate ginger cheesecake"=>4.50,
    "mango and coconut parfait"=>5.00
  }
  end

  def display_menu
    print_header
    format_menu
  end

private

  def print_header
    puts "MENU --- "
  end

  def format_menu
    dishes.each { |item, price| p "#{item}, £#{price}" }
  end

end