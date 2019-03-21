class Menu
  TURKISH_MENU = [
    { name: "Mixed Meze", price: 10 },
    { name: "Lahmacun", price: 4 },
    { name: "Chicken Beyti", price: 10 },
    { name: "Iskender", price: 12 },
    { name: "Icli Kofe", price: 12 },
    { name: "Baklava", price: 6 }
  ]
  RESTAURANT_NAME = "Grill Communication"

  def initialize(items = TURKISH_MENU, name = RESTAURANT_NAME)
    @items = items
    @name = name
  end
  
  def all
    items
  end
  
  def pretty
    heading = ["Oº°‘¨ Welcome to #{name}! ¨‘°ºO"]
    (heading + pretty_format_items).join("\n")
  end

  def get(index)
    raise "Could not find item: item does not exist. "\
          "Try checking the menu again." if @items[index].nil?

    items[index]
  end

  def include?(item)
    items.include? item
  end

  private

  attr_reader :items, :name

  def pretty_format_items
    items.map.each_with_index do |item, index|
      ["#{index}: #{item[:name]}, £#{item[:price]}"]
    end
  end
end
