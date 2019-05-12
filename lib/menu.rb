class Menu

  attr_reader :dishes

  def initialize
    # I could have the menu read from a file in a private method
    # at initialisation. I have chosen to keep things simple here for
    # ease of testing
    @dishes = { burrito: '6.80' }
  end

  def view
    @dishes
  end

  def available?(meal)
    @dishes.to_s.include?(meal) ? true : false
  end

end
