class Menu
  MENU = {
    'Avocado Maki' => 6,
    'Beef Teriyaki' => 10,
    'California Temaki' => 5,
    'Chicken Katsu Curry' => 11,
  }.freeze

  attr_accessor :dishes

  def initialize(dishes = MENU)
    @dishes = dishes
  end

  def view_menu
    @dishes.map { |dish, cost| "#{dish} - £#{cost}" }.join(', ')
  end
end
