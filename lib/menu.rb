class Menu

  attr_reader :menu

  def initialize
    @menu = {'Fish & Chips' => 4, 'Burger' => 3, 'Shawarma' => 5}
  end

  def print_menu
    menu.collect { |dish, price| p [dish, '£' + price.to_s].join(' ')}
        .join(', ')
  end

end
