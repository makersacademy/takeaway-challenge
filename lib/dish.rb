class Dish

  def initialize name
    @name = name.upcase
  end

  def name
    @name.clone
  end

end
