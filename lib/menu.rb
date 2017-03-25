class Menu

  attr_reader :dishes

  def initialize
    @dishes = {"Hamburger" => 3.99, "Pizza" => 9.99, "Fish and Chips" => 4.99, "Curry" => 5.99}
  end

  def view
    dishes.map do |item,price|
      "%s £%.2f" % [item.to_s.capitalize, price]
    end.join(", ")
  end

  def does_not_contain?(item)
    !dishes[item]
  end
end
