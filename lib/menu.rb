class Menu
  JAPANESE_MENU = {
    "chilli squid" => 3.95,
    "duck spring rolls (2)" => 3.95,
    "vegetable spring rolls (v)" => 3.95,
    "aubergine in bean sauce (v)" => 3.95,
    "pork wonton" => 3.95,
    "prawn & salmon wonton" => 3.95,
    "bok choy in ginger & soy (v)" => 3.95,
    "oshitashi (sesame spinach) (v)" => 3.95,
    "edamame (v)" => 2.00,
    "miso soup (v)" => 1.50,
    "kimchee" => 1.95,
    "sesame bean shoots (v)" => 1.95,
    "kfc (korean fried chicken)" => 7.95,
    "korean fried tofu (v)" => 7.95,
    "chicken katsu curry" => 8.95,
    "chicken teriyaki" => 7.95,
    "sesame spicy chicken" => 7.95,
    "salmon teriyaki" => 8.95,
    "korean sweet spicy & chicken" => 8.95,
    "kimchee stew" => 8.95,
    "aubergine & tofu (v)" => 7.95
                    }

  attr_accessor :dishes

  def initialize(dishes = JAPANESE_MENU)
    @dishes = dishes
  end

  def add_to_menu(dish, price)
    dishes[dish] = price
  end

  def remove_from_menu(dish)
    dishes.delete(dish)
  end
end