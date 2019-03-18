require './lib/menu'

class App

  attr_reader :options
  attr_reader :menu

  def initialize(menu = Menu.new)
    @options = [
      "1. Show menu",
      "2. Select dishes",
      "3. Verify order",
      "4. Submit order",
      "5. Exit"
    ]
    @menu = menu
  end

  def show_options
    puts "Select an option:"
    
    while true do
      @options.each { |item| puts item }
      puts "\n"
      selection = gets.chomp.to_i
      return if selection == 5

      if @options[selection-1] == nil
        puts "Selection invalid"
        next
      end

      case selection
      when 1 
        puts "Show menu"
        @menu.show_dishes
        puts "\n"
      when 2 then 
        @menu.show_dishes
        show_dishes_text
        selection = gets.chomp
        puts "\n"
        @menu.select_dishes(clean_input(selection))
        @menu.show_selected_dishes
        puts "\n"
      when 3 then 
        puts "Verify order"
        @menu.verify_order
        puts "\n"
      when 4 then
        puts "Submit order"
        @menu.put_order
      else
        puts "Exit"
      end
    end
  end

  private 

  def clean_input(selection)
    selection.split("").map(&:to_i).reject {|item| item == 0}
  end

  def show_dishes_text
    puts "\n"
    puts "Select dishes"
    puts "\n"
    puts "Submit selection: use the number of the dish"
  end
end

menu = App.new
menu.show_options
