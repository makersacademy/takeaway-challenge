class Menu

  attr_reader :dishes

  def initialize(dishes)
      @dishes = dishes
  end


  def menu_print
      dishes.map do |item, cost|
        "%s £%.2f" % [item.to_s.capitalize, cost]
    end.join(", ")
  end

end

