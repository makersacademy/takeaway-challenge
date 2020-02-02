class Menu
  attr_reader :dishes
  def initialize(dishes)
    @dishes = dishes
  end
# overriding the ruby print method..
  def print
    dishes.map do |title, price|
      # for giving us 2 floats ex 4.50 we are using the methof below
      "%s £%.2f" % [title.to_s.capitalize, price]
    end.join(", ")
  end
  def has_dish?(dish)
    !dishes[dish].nil?
  end
end
