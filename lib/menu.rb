require_relative 'dish'

class Menu

  attr_reader :dishes

  def initialize(*dishes)
    @dishes = dishes
  end

  def format
    "#{header}\n#{format_dishes}"
  end

  private

  def header
    "#{'Dish'.ljust(Dish::FORMAT_LENGTH)} Price\n#{'-' * (Dish::FORMAT_LENGTH + 8)}"
  end

  def format_dishes
    @dishes.map { |dish| dish.format }.join("\n")
  end
end