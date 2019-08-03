class Menu
attr_reader :dishes
def initialize(dishes)
  @dishes = dishes
end

def show
  dishes.map do |name, price|
    "%s £%.2f" % [name.to_s.capitalize,price]
  end.join(", ")
end

def include_dish?(dish)
  !!dishes[dish]
end

def price(dish)
  dishes[dish]
end

end