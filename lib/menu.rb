class Menu

attr_reader :list_of_dishes

  def initialize(list_of_dishes)
    @list_of_dishes = list_of_dishes
  end

  def print_menu
    list_of_dishes.map do |title, price|
      "%s £%.2f" % [title.to_s.capitalize, price]
    end.join(", ")
  end

  def has_dish?(dish)
    !list_of_dishes[dish].nil?
  end
end
