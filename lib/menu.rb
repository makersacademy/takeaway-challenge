
class Menu

attr_reader :items

def items
  {"boquerones" => 5,
    "shishito peppers" => 4,
    "tortilla espanola" => 5,
    "patata bravas" => 5,
    "jamon iberico" => 7,
    "queso mixto" => 7
  }
end

def price(item)
  items[item]
end
end
