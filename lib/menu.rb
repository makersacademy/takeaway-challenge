class Menu
  attr_reader :items
  
  def initialize
    @items = []
  end
  
  def display
    @items.empty? ? "Empty Menu" : "#{@items}"
  end
end