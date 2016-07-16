require_relative 'menu'

class Menu

attr_reader :dishes

ITEMS_LIST = {
  "Mealworm Croquettes" => 1.20,
  "Larve Paprika Crisps" => 1.50,
  "Crunchy Chicken Claw" => 2.40,
  "Zingy Zebra Bites" => 3.80,
  "Springbok rolls" => 4.30,
  "Buffalow salad" => 10.20,
  "Ostrich steak" => 13.55,
  "Crocodile burger" => 14.25,
  "Kangaroo con carne" => 15.20,
  "Python soup" => 17.50,
  "Pufferfish cakes" => 21.50,
}
  def initialize
    @dishes = ITEMS_LIST
  end

  def menu_list
      @dishes.each { |item, price| "#{item}: £#{price}, " }
    end
end
