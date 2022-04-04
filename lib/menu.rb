class Menu
  
  attr_accessor :dishes, :menu
  def initialize
		@dishes = dishes
	end

  def dishes
    dishes = [
      {name: 'Chicken Tikka Masala', price: 6.50},
      {name: 'Pilau Rice', price: 2.50},
      {name: 'Nan Bread', price: 1.95},
    ]
  end

  def menu_items
    @menu_items = []
  end
  
  def list_of_dishes
    dishes.map{ |item, price| menu_items <<item[:name]}
  end
end