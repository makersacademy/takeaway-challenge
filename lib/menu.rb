require_relative 'shopping_basket'

class Menu 

  attr_reader :menu

  def initialize(shopping_basket=ShoppingBasket.new)
    @menu = [
      {pizza: 10},
      {salad: 8},  
      {pasta: 8}, 
      {curry: 11}, 
      {chili: 12}
      ]
    @shopping_basket = shopping_basket
  end 

  def print_menu
    puts "Menu:"
    puts "1) Pizza - £10"
    puts "2) Salad  - £8"
    puts "3) Pasta - £9"
    puts "4) Curry = £11"
    puts "5) Chili - £12"
    puts "6) Finish"

  end

  def process(selection)
    case selection 
      when "1"
        @shopping_basket.add_item(@menu[0])
        puts "Pizza added, total now "
      when "2"
        @shopping_basket.add_item(@menu[1])
        puts "Salad added "
      when "3"
        @shopping_basket.add_item(@menu[2])
        puts "Pasta added, total now "
      when "4"
        @shopping_basket.add_item(@menu[3])
        puts "Curry added, total now "
      when "5"
        @shopping_basket.add_item(@menu[4])
        puts "Pizza added, total now "
      when "6"
        puts "Thankyou, order complete"
        exit #change! 
      end 
  end 

  def interactive_menu
    loop do 
      print_menu
      process(STDIN.gets.chomp)
    end 
  end 
  

end 
