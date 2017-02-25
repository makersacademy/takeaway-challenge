
class Menu
attr_reader :dishes

  def initialize(dishes)
    @dishes = []
    @dishes << dishes
  end

  def display_menu
    @dishes
  end
end # => menu class
