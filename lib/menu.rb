class Menu

  attr_reader :menu

  def initialize
    @menu = []
  end

  def add_dish(name, price)
    @menu.push({ :name => "Bacalhau com natas", :price => 7.5})
  end

end
