class Menu

  attr_reader :dishes

  def initialize(dishes = {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99})
    @dishes = dishes
  end

  def print
    dishes.map { |k, v| "%s £%.2f" % [k.to_s, v] }.join(", ")
  end

  def has_dish?(dish)
    !!dishes[dish]
  end

  def price(dish)
    dishes[dish]
  end

end