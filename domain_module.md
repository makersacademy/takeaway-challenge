Class | Duty
--------------
customer | check_list
Menu | Dishes
Dishes | prices

customer --> check_list <--> Menu <-- Dishes --> prices


Class | Duty
--------------
customer | select_dish(menu, dish, num)
order | dishes and quantity
