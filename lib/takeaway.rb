class Takeaway
  attr_reader :inputs
  def initialize
    @inputs = ARGV
    @menu_data = [ { id: 1, name: 'Chicken Korma', description: 'Mild cream based curry', price: 599 },
                   { id: 2, name: 'Vindaloo', description: 'Very hot curry', price: 699 },
                   { id: 3, name: 'Tikka', description: 'Dry curry', price: 499 } ]
    @menu = Menu.new(@menu_data)
  end

  def start
   welcome

  end

  def welcome
    message = "*----------------------------------*\n" +
              "|  Welcome to Vindayou take away!  |\n" +
              "*----------------------------------*\n"
    puts message
  end

  def menu_header
    puts "Our menu:"
    puts "---------"
  end

  def get_name
    puts "What is your name?"
    gets.chomp.downcase
  end

  def get_number
    puts "What is your number?"
    gets.chomp.downcase
  end

  def print_menu
    menu_header
    @menu.print
  end

  private
  def menu_header
    puts "Our menu:"
    puts "---------"
  end
end
