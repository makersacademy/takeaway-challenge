class Menu
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def print
    items.map do |item, price|
      "#{item}: #{price}"
    end.join(", ")
  end
end
