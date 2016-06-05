class Menu
  attr_reader :all
  
  def initialize
    @all = {}
  end

  def add(item, cost)
    @all[item] = cost
  end

end
