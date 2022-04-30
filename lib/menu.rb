
class Menu

  attr_reader :dishes

  def initialize 
    @dishes = [
      {id: 1, name: 'Spinach & Cheddar Pancakes', price: 7, available?: true},
      {id: 2, name: 'Veggie Breakfast', price: 8, available?: true},
      {id: 3, name: 'Halloumi Sandwhich', price: 7, available?: true},
      {id: 4, name: 'Soup of the Day', price: 8, available?: true},
      {id: 5, name: 'Ceaser Salad', price: 8, available?: true},
      {id: 6, name: 'Pizza', price: 9, available?: true},
      {id: 7, name: 'Vegan Pizza', price: 10, available?: true},
      {id: 8, name: 'Yum Yum Salad', price: 11, available?: true},
      {id: 9, name: 'Singapore Laksa', price: 11, available?: true},
      {id: 10, name: 'Spiced Noodles', price: 11, available?: true},
      {id: 11, name: 'Phad Thai', price: 11, available?: true}
    ]
  end

  def display_dishes
    @dishes.map { |dish| 
      p "#{dish[:id]}. #{dish[:name]} - £#{dish[:price]} - #{dish[:available?] ? 'available' : 'unavailable'}"
    }
  end

  def select_dish(id)
    @dishes.select { |dish| dish[:id] == id }.first
  end

  def dish_price(id)
    dish = select_dish(id)
    dish[:price]
  end

  def dish_available?(id)
    dish = select_dish(id)
    dish[:available?]
  end

end