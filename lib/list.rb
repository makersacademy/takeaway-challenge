class List
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def read
    dishes
  end

  def add(dish)
    @dishes << dish
  end

  def print
    p dishes
  end

  def get(index)
    dishes[index-1]
  end
end
