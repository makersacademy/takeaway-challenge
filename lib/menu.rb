class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      'hamburger' => 8, 
      'fries' => 5, 
      'milkshake' => 5
    }
  end
end
