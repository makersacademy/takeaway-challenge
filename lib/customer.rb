require_relative 'menu'


class Customer


  attr_reader :ordered

  def initialize
    @ordered = []
  end

  def check menu
    menu.items
  end

  def select_dishes(dish,num)
    
    @ordered << [dish,num]
  end


end
