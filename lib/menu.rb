require_relative 'order'

class Menu
  
  MENU = {
    burger: 10,
    fries: 3,
    beer: 5
  }

  def read
    MENU.each {|item, price| puts "#{item} : £#{price}"}
  end

end