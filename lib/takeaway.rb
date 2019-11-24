class Menu

  DEFAULT_MENU = {
    llomo_saltado: 14.99,
    ratatouille: 9,
    chicken_and_chips: 5.50
  }

  attr_reader :dishes_list

  def initialize
    @dishes_list = DEFAULT_MENU
  end

  def print_menu
    dishes_list.map do |dish, price|
      '%s £%.2f' % [dish.to_s.capitalize, price]
    end.join(", ")
  end
end