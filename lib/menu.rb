# An object storing a list of meal dishes
class Menu
  attr_reader :dishes, :selection
  def initialize
    @dishes = []
    @selection = []
  end

  def add(dish)
    @dishes << dish
  end

  def view
    @dishes.each_with_index { |dish, index|
      puts "#{index + 1}. #{dish.name} - £#{'%.2f' % (dish.price / 100.00)}\n"
    }
  end

  def select(dish_index, quantity)
    quantity.times { @selection << @dishes[dish_index - 1] }
  end
end
