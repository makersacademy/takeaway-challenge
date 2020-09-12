class Menu

  attr_reader :dishes

  def initialize(*dish)
    @dishes = []
    dish.each { |dish| @dishes << dish }
  end

  def view
    print_header
    puts format_dishes.join("\n")
  end

  private

  def print_header
    puts "#{"Dish".ljust(20)} Price"
    puts "#{"".ljust(28, '-')}"
  end

  def format_dishes
    @dishes.map { |dish| "#{dish.name.ljust(20)} £#{'%.2f' % dish.price}" }
  end
end