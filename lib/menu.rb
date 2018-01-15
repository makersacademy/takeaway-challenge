

class Menu

  attr_reader :dishes

  def initialize(dishes = menu_list)
    @dishes = dishes
  end

  def show
    dishes.map do |name, price|
      "%s £%.2f" % [name.to_s.capitalize, price]
    end.join(", ")
  end

  def dish_exists?(dish)
    !dishes[dish].nil?
  end

  def find_dish(dish_name)
    menu_list.select do |item|
       item if item.include?(dish_name.to_sym)
    end
  end

  private

  def menu_list
    menu = [
      {pierogi: 4.00},
      {kopytka: 2.00},
      {bigos: 5.20}
    ]
  end

end
