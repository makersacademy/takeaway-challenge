require_relative 'pie'
require_relative 'mash'
require_relative 'chips'

class Menu
  def view
    "1. Pie - £6\n2. Mash - £4\n3. Chips - £5"
  end

  def provide_dish(dish_number)
    if dish_number == 1
      Pie.new
    elsif dish_number == 2
      Mash.new
    else
      Chips.new
    end
  end

end