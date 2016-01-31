class Menu

attr_reader :dishes, :show

  def initialize(dishes)
    @dishes = dishes
  end

  def show
    dishes.map do |item, price|
      "%s: £%.2f" % [item.to_s.capitalize, price]
    end.join(", ")
  end

end
