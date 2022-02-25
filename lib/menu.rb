class Menu
  attr_reader :dishes

  def initialize
    @dishes = [{:Burger=>"£10"}, {:Fries=>"£3"}]
  end

  def dishes
    @dishes
  end
end