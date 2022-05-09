class Menu

  attr_reader :dishes, :name, :price
 
  def initialize(dishes:)
    @dishes = dishes
    @name = ""
    @price = ""
  end

  def print_menu 
    @dishes.map do |name, price|
      @name = name.to_s
      @price = price.to_f
      "%s £%.2f" % [name.to_s.capitalize, price]
    end.join(", ")
  end

end

