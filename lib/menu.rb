class Menu

  # I am using intermezzo: Of Classes here and injecting the class Dish into class Menu
  def initialize(dish = Dish)
    @dish = dish
    @menu = []
    build_menu()
  end

  def show_menu 
    format_menu
  end

  private
  
  def format_menu
    # I would like to revist this and make a money class with pounds and pence.
    # for the purpose of this exercise and time available I will leave this as it is
    @menu.map { |dish| "Dish: #{dish.name}, Price: £#{'%.2f' % dish.price}" }.join("\n")
  end

  def build_menu
    @menu << @dish.new("Curry", 6.50)
    @menu << @dish.new("Spagbol", 7.50)
  end
end
