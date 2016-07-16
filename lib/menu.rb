class Menu

attr_reader :items

  def initialize(items)
    @items = items
  end

  def print_list
    items.map {|item, price| "%s: £%.2f" % [item.to_s.capitalize, price]}.join(", ")
  end

end
