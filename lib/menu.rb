class Menu

  attr_reader :dishes

  BLANKS = 29
  PUB_MENU = {
    name: "price",
    vegetable_soup: 5.5,
    ham_hock: 7.0,
    gravalax: 7.5,
    stilton_pie: 13.5,
    duck_confit: 16.0,
    italian_sausage: 13.5,
    fish_n_chips: 13.5,
    sea_bass: 16.0,
    cheeseburger: 12.5,
    apple_crumble: 6.5,
    chocoloate_brownie: 6.5
  }

  def initialize
    @dishes = import_dishes
  end

  def dishes
     @dishes.clone
  end

  def show
    dishes.reduce("") do |container, (key, value)|
      spacers = BLANKS - (key.to_s.length + (value.to_s.size))
      container + key.to_s + ('.' * spacers) + '£' + value.to_s + "\n"
    end
  end

  private

  def import_dishes
    PUB_MENU.default = 'Dish is not on the menu'
    PUB_MENU
  end

end
