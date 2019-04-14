
class Menu

  def initialize(dishes)
    @dishes = dishes
  end

  def list_dishes
    @dishes.map do |dish_name, price|
      '%s £%.2f' % [dish_name, price]
    end.join(', ')
  end
end