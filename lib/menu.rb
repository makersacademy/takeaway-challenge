class Menu

  attr_reader :items
  
  def initialize(items)
    @items = items
  end

  def prints
    menu = items.map do |key, value|
      "#{key} £#{value}"
    end
    menu.join(", ")
  end

end
