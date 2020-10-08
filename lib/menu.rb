class Menu
  attr_reader :items

  def initialize
    @items = {
      "Blini" => 7,
      "Chicken Kiev" => 15,
      "Shuba" => 11,
      "Bortsch" => 8
    }
  end
  
  def add_item(name, price)
    @items[name] = price
  end

  def delete_item(name)
    @items.delete(name)
  end

  def print_menu
    @items.each do |name, price|
      puts "#{name}, £#{price}"
    end
  end
end
