class Menu
  attr_reader :dishes
  def initialize
    @dishes = { "egg roll" => 10,
    "Butter paneer" => 20,
    "Bhindi" => 15,
    "Roomali roti" => 5,
    "Rice Bowl" => 15 }
  end

  def list
    @dishes
  end
    
  def price(name)
    @dishes[name]
  end

  def available?(name)
    @dishes[name] != nil
  end
end
