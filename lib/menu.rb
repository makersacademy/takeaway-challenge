class Menu
  attr_reader :list

  def initialize(list)
  @list = list
  
  end

  def print_list
    list.map do |dish, price|
      "%s £%.2f" % [dish.to_s.capitalize, price]
    end.join(", ")
  end
end