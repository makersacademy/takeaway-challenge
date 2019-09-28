class Menu

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def print
    items.map do |name, price|
      "%s £%.2f" % [name.to_s.capitalize, price]
    end.join(", ")
  end

end
