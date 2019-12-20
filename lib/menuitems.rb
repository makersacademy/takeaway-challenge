class MenuItems

  attr_reader :menuitems

  # pass in the munu hash
  def initialize(menuitems)
    @menuitems = menuitems
  end

  # return true if item is listed in menuitems
  def has_item?(item)
    menuitems[item] ? true : false
  end

  def price(item)
    menuitems[item]
  end

  # display will return a string with the menu list
  def display
    menuitems.map do |pizza, value|
      "#{pizza.capitalize} £#{value.to_f}"
    end.join(", ")
  end
end
