class Menu

  attr_reader :dishes

  DEFAULT_DISHES = [
    { :name => "spring rolls", :price => 2 },
    { :name => "sour pork", :price => 5 },
    { :name => "vegetables noodles", :price => 4 },
    { :name => "shredded duck", :price => 7 },
    { :name => "dumplings", :price => 3 },
    { :name => "chop suey", :price => 4 }
  ]

  def initialize
    @dishes = DEFAULT_DISHES
  end
end
