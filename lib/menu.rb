class Menu
  attr_reader :list_of_dishes

  def initialize(list_of_dishes)
    @list_of_dishes = list_of_dishes
  end

  def list_menu
    list =@list_of_dishes.map {|dish, price| "#{dish}: $#{price}"}
    list.join(", ")
  end
end
