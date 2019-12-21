class MenuItems

  attr_reader :menuitems

  MENU_ITEMS = { regina: 12.89, hawaiian: 18.99, bbq_chicken: 12.99,
                 vegan: 14.99, vegetarian: 8.99 }

  def initialize(menuitems = MENU_ITEMS)
    @menuitems = menuitems
  end

  def has_item?(item)
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
