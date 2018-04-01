require_relative 'dish'

class Menu

  DEFAULT_TOTAL = 0

  attr_reader :dishes
  attr_accessor :selection, :total

  def initialize(total = DEFAULT_TOTAL)
    @dishes = []
    @selection = []
    @total = total
  end

  def make_dish(type, price)
    @type = type
    @price = price
    @dish = {type => price}
  end

  def add_dish
    @dishes << @dish
  end

  # def remove(dish)
  #   @dishes.delete(dish)
  # end

  def select_sushi
    @total += 1
    @selection << {"sushi" => 1}
  end

  def select_laksa
    @total += 1
    @selection << {"laksa" => 1}
  end

  def select_pizza
    @total += 1
    @selection << {"pizza" => 1}
  end

end
