class Menu

  attr_accessor :dishes

  def initialize
    @dishes = []
  end

  def add_dish dish
    @dishes << dish
  end

  def show_menu
    @dishes.each { |dish| "Name: #{dish.name}; Price: £#{dish.price}" }
  end

end