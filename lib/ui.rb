require 'menu'

class UI
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def print_options
    options = ['1. Print menu', '2. Add items to basket',
         '3. Checkout', '4. Exit']
    p options
  end

  def print_menu
    @menu.print
  end

  def process(selection)
    case selection
      when "1"
        print_menu
      when "4"
        exit
      else
        "I don't know what you mean, please try again"
    end
  end

  def interactive_menu
    loop do
      print_options
      input = gets.chomp
      process(input)
    end
  end

end
