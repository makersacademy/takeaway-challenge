class Dish
  attr_reader :name, :price, :dish_info, :allergy_info
  def initialize(name, price, allergy_info = "No specifications regarding allergies")
    @name = name
    @price = price
    @dish_info = { name => price }
    @allergy_info = allergy_info
  end
end
