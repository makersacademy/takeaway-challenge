class Menu

  attr_reader :dishes

  def initialize
    @dishes = {'pizza' => 4, 'chicken' => 6, 'dessert' => 3, 'drink' => 1}
  end

  def price(item)
    @dishes[item]
  end


end
