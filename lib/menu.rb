class Menu

  attr_reader :dishes

  def initialize
    @dishes = {'Brains' => 5}
  end


  def list_dishes
    dishes
  end

end
