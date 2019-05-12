class Order

  attr_reader :choice

  def initialize(menu = Menu.new)
    @menu = menu
    @choice = []
  end

  def add(dish, number = 1)
    # This delegates the role of checking if the dish exists to the Menu class
    raise "#{dish} is not available" if @menu.available?(dish) == false
    # I could also have the choice take the form of a Hash which has a
    # key => value pair of dish => number 
    number.times { @choice << dish }
    choice
  end

end
