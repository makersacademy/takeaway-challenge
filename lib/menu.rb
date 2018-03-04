# Menu class definition.
# It's responsible for saving dishes to menu and having Menu updated
class Menu
  attr_reader :menu
  def initialize
    @menu = []
  end

  def add(dish)
    raise 'Menu item already exists' if menu.include?(dish)
    @menu << dish
  end

  def remove(dish)
    raise 'Dish not found in the menu' unless menu.include?(dish)
    @menu.delete(dish)
  end

  def list_all
    puts ''
    puts '=' * 50
    puts 'Blah Blah Kitchen Menu'.center(40)
    puts '=' * 50
    puts "No.".ljust(5) + "Dish".center(30) + "Price".rjust(15)
    puts '-' * 50
    @menu.uniq.each_with_index do |v, i|
      puts "#{i + 1}.".ljust(5) + "#{v.name}".center(30) + "£#{v.price}".rjust(15)
    end
    puts '=' * 50


  end
end
