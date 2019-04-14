class Dish

  attr_reader :menu

  def initialize
    @menu = {
      :lamb => 6,
      :chicken => 5,
      :samosa => 2,
      :paneer => 3,
      :naan => 2,
      :bhaji => 2
    }
  end

  def on_the_menu?(dish)
    @menu.key?(dish.to_sym)
  end
end
