class Menu
  attr_reader :dishes

  def initialize
    @dishes = Hash.new
  end

  def to_s
    return "Menu is empty" if @dishes.empty?
    @dishes.map { |name, price| "* #{name} - #{price}" }.join('\n')
  end

  def add_item(name, price)
    @dishes[name] = price
  end

  def price(dish)
    @dishes[dish]
  end
end
