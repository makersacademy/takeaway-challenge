require_relative 'calculator'
class Item

  attr_reader :name, :price

  def initialize(name, calculator = Calculator)
    @name = name
    @calculator = calculator.new
    @price = @calculator.calculate_price(@name)
  end
end
