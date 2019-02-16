class Menu

  attr_reader :dishes, :selection

  def initialize
    @dishes = [{ :dish => "Chicken", :price => "£3.50" },
    { :dish => "Pizza", :price => "£4" }]
  end

  def print_menu
    @dishes.map { |x| x.values.join(" ") }
  end

end
