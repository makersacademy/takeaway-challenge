class Menu

  attr_reader :dishes

def initialize(dishes)
  @dishes = dishes
end

  def print_menu
    dishes.map do |title,_price|
      "%s £%.2f" % [title.to_s.capitalize, _price]
    end.join(", ")
  end
end
