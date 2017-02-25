class Menu

attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print_menu
    dishes.map do |name, price|
    "%s: £%.2f" % [name.to_s.capitalize, price]
    end.join(', ')
<<<<<<< HEAD
  end 
=======
  end
>>>>>>> 5972278c70fd17b646593edbf19e6607699a6cb4

  def price(dish)
    dishes[dish]
  end
end
