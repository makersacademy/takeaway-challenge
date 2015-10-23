class Menu

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def choose(description)
    @dishes.find {|dish| dish.description == description}
  end

  def dishes
    @dishes.dup
  end

  def to_s
  end
end
