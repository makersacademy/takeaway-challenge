class Menu
  attr_reader :dishes

  def initialize(dishes = {
    "kartofler" => 5.50,
    "smorrebrod" => 5.99,
    "kanelsnegle" => 3.50,
    "kransekage" => 2.99 })
    @dishes = dishes
  end
end
