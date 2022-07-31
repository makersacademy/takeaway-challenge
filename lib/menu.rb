class Menu
  attr_accessor :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def list
    "#{@dishes[0].name} | #{@dishes[0].price}"
  end
end
