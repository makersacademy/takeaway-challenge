class Menu
  def initialize
    @menu = []
  end

attr_reader :menu

  def add_dish(dish)
    @menu << dish
  end

  def view_menu
    @menu.each do |dish|
      puts "#{dish.name}: £#{dish.price}"
    end
  end
end