

class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def show_menu
  end

private

  def load_menu
    # load up from file stuff
  end

end
