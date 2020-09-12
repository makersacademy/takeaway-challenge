require_relative 'dish'

class Menu

  attr_reader :dishes

  def initialize(*dishes)
    @dishes = dishes
  end

  def view
    print_header
    print_dishes
  end

  private

  def print_header
    puts "#{"Dish".ljust(20)} Price"
    puts "#{"".ljust(28, '-')}"
  end

  def print_dishes
    formatted_dishes = @dishes.map { |dish| dish.format }
    puts formatted_dishes.join("\n")
  end
end