class Menu

attr_reader :menu

def initialize
  @menu = [
  { item: 'Korma', price: 10.00 },
  { item: 'Katsu', price: 14.00 },
  { item: 'Salad', price: 9.00 },
  { item: 'Prawns', price: 2.50 }
  ]
end

end