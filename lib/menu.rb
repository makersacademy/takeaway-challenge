class Menu
  MENU = {
    burger: 7,
    hamburger: 7,
    chips: 2
  }
  attr_accessor :dishes

  def initialize(dishes= MENU)
    @dishes = dishes
  end

  def see_menu
    @dishes.map { |dish, price| "#{dish} = £#{price}"}.join(', ')
  end

end
