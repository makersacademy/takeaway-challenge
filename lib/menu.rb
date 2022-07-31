class Menu
  attr_reader :dishes, :printed_menu

  def initialize(dishes = { "pepperoni" => 8, "veggie" => 8, "hawaiian" => 9, "bbq chicken" => 10 })
    @dishes = dishes
  end

  def print
    @printed_menu = ""
    dishes.each do |item, value|
      @printed_menu += "#{item}: £#{value}. "
    end
    @printed_menu
  end
end
