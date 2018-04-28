class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(name, price)
    @dishes << [name, price]
    "#{name} added"
  end
end
