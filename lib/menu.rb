class Menu

  attr_reader :dishes

  def initialize(dish_hash)
    @dishes = dish_hash

  end

  def printing_menu
    dishes.map do |name, price|
      "#{name.to_s.capitalize} #{price}"
    end.join(", ")
  end

end
