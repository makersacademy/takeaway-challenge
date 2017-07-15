class Menu

  attr_reader :name

  def initialize(name, dishes)
    @name = name
    @dishes = dishes
  end

  def dishes
    @dishes.dup
  end

end
