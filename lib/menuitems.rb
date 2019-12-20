class MenuItems

  attr_reader :menuitems

  def initialize(menuitems)
    @menuitems = menuitems
  end

  def item?(item)
    menuitems[item] ? true : false
  end

  def price(item)
    menuitems[item]
  end

  def display
    menuitems.map do |pizza, value|
      "#{pizza.capitalize} £#{value.to_f}"
    end.join(", ")
  end
end
