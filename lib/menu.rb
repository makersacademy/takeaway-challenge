class Menu
  attr_accessor :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def list
    @dishes.each do |dish|
      p dish
    end
  end
end
