class Menu

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def print
    items.map do | name, price |
      "%s £%.2f" % [name.to_s.capitalize, price]
    end.join(", ")
  end

  def is_available?(item)
    items.include?(item)
  end

  def price(item)
    items[item]
  end

end
