class Menu
  attr_reader :list

  def initialize
    @menu = []
  end

  def add(item)
    @menu << item.str
  end

  def show
    @menu
  end
  
end
