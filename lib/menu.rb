class Menu

  attr_reader :dishes

  def initialize
    @dishes = { burrito: '6.80'}
  end

  def view
    @dishes
  end

  def available?(meal)
    @dishes.to_s.include?(meal) ? true : false
  end

end
