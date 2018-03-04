# Menu class definition.
# It's responsible for saving dishes to menu and having Menu updated
class Menu
  attr_reader :menu
# initialises with an empty array for menu items
  def initialize
    @menu = []
  end

# add methhod simply adds dish object to @cart[] if it doesn't
# include already. If it does then throws error
  def add(dish)
    raise 'Menu item already exists' if menu.include?(dish)
    @menu << dish
  end

# remove methhod removes dish object from @cart[] if it is in
# there already. If not, then throws error
  def remove(dish)
    raise 'Dish not found in the menu' unless menu.include?(dish)
    @menu.delete(dish)
  end

# list_all simply prints a @menu[] prettier
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
