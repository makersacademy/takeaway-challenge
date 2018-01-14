class Menu

  attr_reader :dishes

  def initialize(dishes)
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

end
