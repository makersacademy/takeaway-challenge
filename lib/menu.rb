class Menu

  def initialize(dishes)
    @dishes = dishes
  end

  def list_menu
    list =dishes.map {|dish, price| "#{dish}: $#{price}"}
    list.join(", ")
  end
  attr_reader :dishes
end
