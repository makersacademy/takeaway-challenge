require_relative 'dish'

class Menu

  attr_reader :dishes

  FORMAT_LENGTH = 20

  def initialize(*dishes)
    @dishes = dishes
  end

  def format
    "#{header}\n#{format_dishes}"
  end

  private

  def header
    "#{'Dish'.ljust(FORMAT_LENGTH)} Price\n#{'-' * (FORMAT_LENGTH + 8)}"
  end

  def format_dishes
    @dishes.map { |dish|
      "#{dish.name.ljust(FORMAT_LENGTH)} £#{'%.2f' % dish.price}"
    }.join("\n")
  end
end