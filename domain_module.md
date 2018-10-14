Class    |    Duty
----------------------
customer|check_list
Menu|Dishes 
Dishes|prices 



customer --> check_list <--> Menu <-- Dishes --> prices


Class    | Duty
--------------
customer | select_dish(menu, dish, num)
order    | dishes and quantity



Class | Duty
--------------
customer | verify_order
customer | total_balance
order    | printed list + total
order    | total



Class | Duty
--------------
customer | place_order
Takeaway | receive_order
Takeaway | send_order
Takeaway | init message(send_order)



place_order--> Takeaway.receive_order
receive_order ---> init message <--- send_order
