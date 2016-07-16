class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      :sashimi => 5,
      :tempura => 4,
      :uni => 4
    }
  end

end
