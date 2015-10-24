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
    @dishes.inject(String.new) {|memo, dish| memo << "#{dish.to_s}\n" }
  end
end
