class Menu
  attr_reader :dishes

  DISHES = [
    ['tasting platter (for two people)', 18.20],
    ['steamed dim sum platter', 11.60],
    ['peking duck', 54.95],
    ['classic crispy aromatic duck (quarter)', 10.45],
    ['crispy aromatic lamb', 9.45],
    ['vegetarian lettuce wrap', 8.20],
    ['raw vegetable salad', 5.25],
    ['crispy vegetable spring rolls (4)', 4.60],
    ['crispy prawn rolls (4)', 4.60],
    ['classic sesame prawn toast (4)', 4.60],
    ['grilled vegetable gyozas (4)', 4.80],
    ['steamed crystal prawn dumplings (4)', 4.80],
    ['pan-fried tofu', 4.60],
    ['deep-fried soft-shell crab', 8.35],
    ['deep-fried squid', 6.50],
    ['spare ribs in capital sauce', 6.50],
    ['spare ribs in honey sauce', 6.50],
    ['pan-fried spare ribs', 6.50],
    ['marinated chicken satay skewers (4)', 5.65],
    ['shredded chicken smoked with beechwood', 5.65]
  ]

  def initialize
    @dishes = []
    @dishes = populate_menu_with_dishes
  end

  private

  Dish = Struct.new(:name, :price)
  
  def populate_menu_with_dishes
    Menu::DISHES.each do |dish|
      @dishes << Dish.new(dish[0], dish[1])
    end
    @dishes
  end
end
