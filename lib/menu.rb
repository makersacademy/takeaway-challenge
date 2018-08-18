class Menu

  def initialize
    @dishes = {}
  end

  def add(dish)
    @dishes[dish.name] = dish.price
  end

  def view_menu
    @dishes.map { |name, price| "#{name} - #{price}" }
  end

end
