class Menu

  attr_reader :items

  def initialize
    @items = [{ item_number: 1, scaldy: "hot pea", price: 4.00, available: true },
      { item_number: 2, scaldy: "hot tomato", price: 4.25, available: true },
      { item_number: 3, scaldy: "matzo ball", price: 5.00, available: false },
      { item_number: 4, scaldy: "hot potato", price: 3.75, available: true}
    ]
  end

  def view_menu
    @items
  end
  #is this method necessary? Taking it out doesn't break tests...
end
