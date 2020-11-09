require_relative 'dish'

class Menu

  attr_reader :name, :contents

  DEFAULT_CONTENTS = [Dish.new("Arrabiata", 9.99), Dish.new("Bruschetta", 5.99)]
  DEFAULT_NAME = "Savanna's Kitchen"

  def initialize(name = DEFAULT_NAME, contents = DEFAULT_CONTENTS)
    @name = name
    @contents = contents
  end

  def view_menu
    print_header
    print_dish_name_and_price
  end

  private

  def print_header
    puts "Welcome to #{@name}"
  end

  def print_dish_name_and_price
    @contents.each { |dish| puts "#{dish.name}: £#{dish.price}" }
  end
end
