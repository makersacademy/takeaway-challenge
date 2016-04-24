require "menu"

class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def display
    dishes.map do |name,price|
      "%s £%.2f" %[name.to_s.capitalize, price]
    end.join(", ")
  end

  def has_name?(name)
    !!dishes[name]
  end

  def price(name)
    dishes[name]
  end


end
