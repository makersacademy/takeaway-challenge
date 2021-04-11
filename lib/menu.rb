class Menu
  attr_reader :items
  def initialize(items)
    @items = items
  end

  def display
    @items.map { |name, price| "#{name}: £#{price}" }.join(", ")
  end
end
