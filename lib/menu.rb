class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      curry: 6,
      rice: 5,
      burger: 4,
      chips: 2,
      wings: 5
      }
  end
end