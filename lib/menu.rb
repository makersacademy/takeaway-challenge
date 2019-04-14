
class Menu
  DEFAULT_MENU = {
        Waakye: 3.99,
        Kenkey: 2.49,
        Koko: 1.50,
        Banku: 3.50,
        Ampesi: 4.50
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