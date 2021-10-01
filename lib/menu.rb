# Create a Menu class that can list, add and remove dishes.

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

  def remove(dish)
    @dishes.delete(dish)
  end
end