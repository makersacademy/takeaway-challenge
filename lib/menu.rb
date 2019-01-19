class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_item(item)
    @dishes << item
  end

  def print_menu
    dishes.map do |item|
      "%s £%.2f" % [item.name, item.price]
    end.join(", ")
  end

  def has_item?(item)
    @dishes.include?(item)
  end
end
