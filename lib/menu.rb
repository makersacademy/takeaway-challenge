class Menu
  attr_reader :menu_array
  def initialize
    @menu_array = [
      { item: 'sourdough    bread   w/   garlic', price: 12.5 },
      { item: 'onion  bread  w/  cherry  tomato', price: 12.5 },
      { item: 'burrata   cheese    w/  ciabatta', price: 15.5 },
      { item: 'mozarella bites w/ mango chutney', price: 15.5 },
      { item: 'carbonara pizza with white sauce', price: 16.5 },
      { item: 'pasta   margherita    originiale', price: 17.0 },
      { item: 'sparking  water  de  la fontaine', price: 12.0 },
      { item: 'valpolicella  ripasso  red  wine', price: 32.0 },
      { item: 'amarone    della    valpolicella', price: 50.0 }
    ]
  end
end
