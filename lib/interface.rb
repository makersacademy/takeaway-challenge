require './lib/menu.rb'

class Interface

  def initialize
    @menu = Menu.new
    input
  end

  def input
    puts "Type in number for interface action"
    options
    response
  end

  def options
    puts "1. Look at menu"
    puts "9. Exit"
  end

  def response(res)
    res = $stdin.gets.chomp
    case res
    when "1"
      @menu.show_menu
      input
    when "9"
      puts "Thankyou!"
      exit
    else
      puts "Unrecognized input! Try again."
      input
    end
  end

end
