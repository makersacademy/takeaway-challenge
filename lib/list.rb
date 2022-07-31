require_relative 'dish'

class List
  attr_reader :dish
  # def initialize
  #   @dishes = []
  # end

  def see_list
  end

  def select_dish(dish)
    @dish = dish
  end
end
