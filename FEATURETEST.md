#### Takeaway-challenge Feature-test

# 1. Creates a new takeaway
ldv = Takeaway.new
# 2. Can add new items to that menu
item1 = Dish.new("Pizza", 10)
item2 = Dish.new("Kebab", 5)
ldv.add(item2)
ldv.add(item1)
# 3. Can display its menu
ldv.show_menu
# 4. Can create a new order
ldv.new_order
# 5. Can add items to that order
ldv.order.add(item1)
ldv.order.add(item2)
# 6. It can check that the total is correct
ldv.order   # Displays the individual items and their prices in plain english along with the total so it can be verified
# 7. It can send a confirmation text upon order completion with delivery time
ldv.complete_order
### NOTE that personal details have been removed so to test text functionality a .env file must be created with twilio SID, Auth token, and both phone numbers.