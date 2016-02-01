class Menu

  attr_reader :options

  def initialize
    @options = Hash.new(0)
  end

  def add_item(meal, price)
    @options[meal] = price
  end

  def remove_item(meal)
    @options.delete(meal)
  end

end
