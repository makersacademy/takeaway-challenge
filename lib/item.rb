require_relative 'menu'


class Item

attr_reader :name, :price

def initialize(menu)
  @name = menu['name']
  @price = menu['price']
end

end
