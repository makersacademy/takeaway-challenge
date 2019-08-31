class MenuList
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_item(identifier, dish)
    dishes << { id: identifier, dish: dish }
  end
end
