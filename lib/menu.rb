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

  def has_dish?(name_of_dish)
    !!dishes[name_of_dish]
  end

end
