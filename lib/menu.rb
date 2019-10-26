class Menu
  
  attr_reader :dishes
  
  def initialize(dishes)
    @dishes = dishes
  end

  def print
    dishes.map do |title, price|
      "%s: £%.2f" % [convert_to_string(title), price]
    end.join(", ")
  end

  def has_dish?(dish)
    !dishes[dish].nil?
  end

  def price(dish)
    dishes[dish]
  end

  private

  def convert_to_string(dish)
    dish.to_s.gsub("_"," ").split.map(&:capitalize).join(' ')
  end

end