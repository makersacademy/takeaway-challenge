require_relative 'order'

class Menu
  
  attr_reader :menu
  
  MENU = {
    burger: 10,
    fries: 3,
    beer: 5
  }

  def initialize
    @menu = MENU
  end

  def read
    @menu.each {|dish, price| puts "#{dish} : £#{price}"}
  end

end