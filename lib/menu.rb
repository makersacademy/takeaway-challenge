class Menu

  attr_reader :dish_list

  def initialize dish_list
    @dish_list = dish_list
  end

  def list_dishes
    @dish_list.dup
  end

  def retrieve_price dish_name
    @dish_list[dish_name]
  end

end
