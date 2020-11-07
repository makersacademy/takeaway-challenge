class Order

  MENU = {
    1 => {item: :'curry goat', price: 9},
    2 => {item: :'brown stew chicken', price: 8},
    3 => {item: :'jerk chicken', price: 8},
    4 => {item: :'steamed fish', price: 7},
    5 => {item: :'vegetable curry', price: 6},
    6 => {item: :'brown rice', price: 4},
    7 => {item: :'white rice', price: 4},
    8 => {item: :'roti', price: 5},
    8 => {item: :'salad', price: 4}
  }

  def see_menu
    MENU
  end

end