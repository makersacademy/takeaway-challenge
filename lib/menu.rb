class Menu

  attr_accessor :dishes

  def initialize
    @dishes = []
  end

  def add_dish dish
    @dishes << dish
  end

  def show_menu
    @dishes.each { |d| p "Name: #{d.name.capitalize}; Price: £#{d.price}" }
  end

end