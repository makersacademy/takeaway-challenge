require_relative 'menu'

class Takeaway
  
  def initialize(menu = Menu.new)
    @menu = menu
    
  end

  def menu_print
    display = ""
    @menu.list.each do |dish, price|
    display << "#{dish}: £#{price}\n"
    end
    puts display.split(",")
  end


end