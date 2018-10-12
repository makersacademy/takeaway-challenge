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

Class | Duty
--------------
customer | verify_order
order | printed list + total
order | total
