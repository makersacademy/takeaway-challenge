class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
    populate_menu_with_dishes
  end

  private

  Dish = Struct.new(:name, :price)
  
  def populate_menu_with_dishes
    @dishes << Dish.new('tasting platter (for two people)', 18.20)
    @dishes << Dish.new('steamed dim sum platter', 11.60)
    @dishes << Dish.new('peking duck', 54.95)
    @dishes << Dish.new('classic crispy aromatic duck (quarter)', 10.45)
    @dishes << Dish.new('crispy aromatic lamb', 9.45)
    @dishes << Dish.new('vegetarian lettuce wrap', 8.20)
    @dishes << Dish.new('raw vegetable salad', 5.25)
    @dishes << Dish.new('crispy vegetable spring rolls (4)', 4.60)
    @dishes << Dish.new('crispy prawn rolls (4)', 4.60)
    @dishes << Dish.new('classic sesame prawn toast (4)', 4.60)
    @dishes << Dish.new('grilled vegetable gyozas (4)', 4.80)
    @dishes << Dish.new('steamed crystal prawn dumplings (4)', 4.80)
    @dishes << Dish.new('pan-fried tofu', 4.60)
    @dishes << Dish.new('deep-fried soft-shell crab', 8.35)
    @dishes << Dish.new('deep-fried squid', 6.50)
    @dishes << Dish.new('spare ribs in capital sauce', 6.50)
    @dishes << Dish.new('spare ribs in honey sauce', 6.50)
    @dishes << Dish.new('pan-fried spare ribs', 6.50)
    @dishes << Dish.new('marinated chicken satay skewers (4)', 5.65)
    @dishes << Dish.new('shredded chicken smoked with beechwood', 5.65)
  end
end
