class Menu

  def initialize
    @dishes = []
  end

  def view
    current_menu = []
    @dishes.each_with_index do |dish, idx|
      current_menu << "\n" if idx != 0
      current_menu << format(dish)
    end
    current_menu.join
  end

  def add(dish)
    @dishes << dish
  end

  private

  def format(dish)
     "#{dish.name}: #{price(dish.price)}"
  end

  def price(stored_price)
    sprintf("£%2.2f", stored_price)
  end

end
