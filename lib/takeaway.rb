require_relative 'menu'

class TakeAway

  attr_reader :menu, :basket

  def initialize( menu = Menu.new )
   @menu = menu
   @basket = []
  end

  def get_menu
    p "Tanil's Restaurant Menu List:"
    @menu.generator
  end

  def select( meal_number )
    p "burada"
    p @menu
    p @menu.list
   @basket << @menu.list[ meal_number - 1 ]
   p "orada"
   p @menu.list[ meal_number - 1 ]
   p @basket
  end

end
