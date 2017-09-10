class Menu



attr_reader :dishes, :print

  def initialize(dishes)
    @dishes = dishes
  end


  def print
    dishes.map do |type, price|
      "%s £%.2f" % [type.to_s.capitalize, price]
    end.join(", ")
  end



# def initialize(menu)
#   @menu = menu
# end
#
# def print_menu
#
# end


end
