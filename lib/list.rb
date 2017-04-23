class List
attr_reader :dishes

LIST_OF_DISHES =
{'Chow Mein' => 5.99, 'Crispy shredded beef' => 6.99,
 'Lamb Pasanda' => 7.99, 'King Prawn Jahlfrezi' => 8.99,
 'Supreme Mega Deluxe Royale Meal' => 399.99}

def initialize
  @dishes = LIST_OF_DISHES
end
end
