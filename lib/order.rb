require_relative 'till'

class Order

  include Till

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish dish, quantity = 1
    quantity.times { @dishes << dish }
  end

  def running_total
    total @dishes
  end

  def display_running_order
    display_order @dishes
  end

end