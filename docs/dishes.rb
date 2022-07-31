class Dishes

  attr_reader :dish_list

  def initialize(dish_list)
    @dish_list = dish_list
  end

  def print_dishes
    dish_list.map do |name, price|
      '%s £%.2f' % [name.to_s, price]
    end.join ', ' 
  end
end
