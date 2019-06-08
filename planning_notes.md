I will need 4 classes:

  Dish - create a new dish with a name & price
  Menu - list of available dishes
  Order - manage my current order
  Place_Order - check sum is correct & send text confirmation

  Menu will be 5 items long. Each item is a hash, the key is the item name
  & the value is a hash containing the price & later the quantity:

  {
    jollof_rice: { price: 6 },
    fried_plantain: { price: 3 },
    jerk_chicken: { price: 8 },
    vegetable_patty: { price: 4.5 },
    ice_cream: { price: 4 }
  }