class Menu
  attr_reader :items
  
  def initialize(items = [])
    @items = items
  end
  
  def display
    available_items = []
    @items.each do |item| 
      available_items << "#{item[:name]}: #{item[:price]}" if item[:quantity].positive? 
    end
    @items.empty? ? "Empty Menu" : available_items.join(", ")
  end

  def update(name, quantity)
    @items.each { |item| item[:quantity] -= quantity if item[:name] == name }
  end

  def find_item(name)
    @items.find { |item| item[:name] == name }
  end
end
