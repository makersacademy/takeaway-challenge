
class Menu
  attr_reader :dishes
  DEFAULT_MENU = {
        Waakye: 3.99,
        Kenkey: 2.49,
        Koko: 1.55,
        Banku: 3.59,
        Ampesi: 4.95
       }

  def initialize(dishes = DEFAULT_MENU)
    @dishes = dishes
  end

  def list_dishes
    @dishes.map do |dish_name, price|
      '%s £%.2f' % [dish_name, price]
    end.join(', ')
  end
end