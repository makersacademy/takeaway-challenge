# An object storing a list of meal dishes
class Menu

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def view
    @dishes.each_with_index { |dish, index|
    puts "#{index + 1}. #{dish.name} - £#{'%.2f' % (dish.price / 100.00)}\n"
    }
  end
end
