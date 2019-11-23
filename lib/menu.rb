class Menu
  attr_reader :menu

  def initialize
    @dishes = []
  end

  def item(option)
    @dishes[option - 1][:dish]
  end

  def add_dishes(*dishes_to_add)
    dishes_to_add.each { |dish| @dishes.push dish }
  end
end
