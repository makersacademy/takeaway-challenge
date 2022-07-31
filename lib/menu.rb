

class Menu
  attr_accessor :menu

  def initialize
    @menu = {
       'margarita': 8.50, 'pepperoni': 11, 'hawaiian': 10,
       'BBQ': 11, 'vegitarian': 10.5, 'meat-feast': 12.5
     }
  end

  def print_menu
    @menu.each { |pizza, price| puts "- #{pizza} $#{price}"}
  end

end