require 'menu'
require 'order'


class App

  def get_option
   puts "Choose what you want to do: "
   puts "1 - View Menu"
   puts "0 - Exit"

   return gets.chomp
  end

  def start
    while get_option != "0"
      
      system "clear"
    end
  end

end

App.new().start
