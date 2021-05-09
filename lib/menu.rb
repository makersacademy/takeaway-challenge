class Menu
  attr_reader :items
  
  def initialize
    @items = []
  end
  
  def display
    @items ? "#{@items}" : "Empty Menu"
  end
end