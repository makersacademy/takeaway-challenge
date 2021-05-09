class Menu
  attr_reader :items
  
  def initialize(items = [])
    @items = items
  end
  
  def display
    @items.empty? ? "Empty Menu" : "#{@items}"
  end

  def update(name, quantity)
    @items.each { |item| item[:quantity] -= quantity if item[:name] == name }
  end

  def find_item(name)
    @items.find { |item| item[:name] == name }
  end
end
