class Menu
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def print
    @items.map do |item, price|
      "#{item}: £#{'%.2f' % price}\n"
    end.join("")
  end

end
