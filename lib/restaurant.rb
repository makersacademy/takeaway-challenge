class Restaurant # understands storing the menu

  attr_reader :menu

  def initialize
    @menu =  {kimchi_pancake: 2.99,
              prawn_pancake: 4.00,
              mixed_tempura: 4.50,
              steamed_dumpling: 6.00,
              spicy_crab: 12.00,
              grilled_mackarel: 9.50,
              steamed_cod: 10.99,
              fried_chicken: 15.00,
              bulgogi: 15.50,
              chicken_teriyaki: 12.00,
              sticky_rice: 2.50,
              rice_cakes: 6.50,
              mixed_veg_rice: 4.99,
              spicy_veg_soup: 12.50,
              kimchi_stew: 8.50,
              ginseng_chicken_soup: 9.50}
  end

  def view
    menu.map do |item, price|
      "#{item.to_s.gsub("_", " ").capitalize}: £#{price}"
    end.join(";  ")
  end
end
