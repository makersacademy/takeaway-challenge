class Dishes
  attr_reader :dishes

  def initialize
    @dishes = { 'chicken' => 10.35 }
  end

  def display
    @dishes
  end

end
