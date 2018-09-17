
class Menu

attr_reader :items

  def initialize
    @items = {
      'Burger' => 10,
      'Fries' => 4,
      'Nugs' => 6,
      'Drink' => 3
    }
  end

  def display_items
    items.each do |item, price|
      puts item + ': £' + price.to_s
    end
  end




end
