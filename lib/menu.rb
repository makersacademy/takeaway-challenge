# The dish inventory will store a list of all the available dish objects

require_relative 'dish'
require_relative 'order'
require_relative 'takeaway'
require_relative 'sms_sender'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    dishes << dish
  end

  def remove_dish(dish)
    raise "Sorry the inventory is empty" if dishes.empty?
    dishes.delete(dish)
  end

  def has_dish?
  end

end
