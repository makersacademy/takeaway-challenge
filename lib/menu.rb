
class Menu

  DISHES = [
    { id: 1, name: 'Spinach & Cheddar Pancakes', price: 7, available?: true, quantity: 0 },
    { id: 2, name: 'Veggie Breakfast', price: 8, available?: true, quantity: 0 },
    { id: 3, name: 'Halloumi Sandwhich', price: 7, available?: true, quantity: 0 },
    { id: 4, name: 'Soup of the Day', price: 8, available?: true, quantity: 0 },
    { id: 5, name: 'Ceaser Salad', price: 8, available?: true, quantity: 0 },
    { id: 6, name: 'Pizza', price: 9, available?: true, quantity: 0 },
    { id: 7, name: 'Vegan Pizza', price: 10, available?: true, quantity: 0 },
    { id: 8, name: 'Yum Yum Salad', price: 11, available?: true, quantity: 0 },
    { id: 9, name: 'Singapore Laksa', price: 11, available?: true, quantity: 0 },
    { id: 10, name: 'Spiced Noodles', price: 11, available?: true, quantity: 0 },
    { id: 11, name: 'Phad Thai', price: 11, available?: true, quantity: 0 },
    { id: 12, name: 'Caponata', price: 11, available?: false, quantity: 0 }
  ].freeze

  attr_reader :dishes

  def initialize 
    @dishes = DISHES
  end

  def display
    @dishes.map do |dish| 
      p "#{dish[:id]}. #{dish[:name]} - £#{dish[:price]} - #{dish[:available?] ? 'available' : 'unavailable'}"
    end
  end

  def select_dish(id)
    @dishes.select { |dish| dish[:id] == id }.first
  end

  def dish_available?(id)
    dish = select_dish(id)
    dish[:available?]
  end

  def id_valid?(id)
    @dishes.select { |dish| dish[:id] == id } != []
  end

end
