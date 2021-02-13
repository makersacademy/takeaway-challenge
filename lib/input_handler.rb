require './basket'
require './menu'
require './ui'

class InputHandler

  def get_dish_number
    gets.chomp
  end

  def get_dish_quantity
    gets.chomp
  end


  def complete
    gets.chomp
  end
end
