class Menu

  attr_reader :dishes

  DEFAULT_DISHES = [{ :name => "spring roll", :price => 2 }]

  def initialize
    @dishes = DEFAULT_DISHES
  end
end
