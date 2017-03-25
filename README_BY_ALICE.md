## Approach / Lessons learned
- mapped out functions 
- diagrammed flowchart of functions 
- decided to use Menu as user interface 

## Classes
### Menu
- User interface i.e. to initialize order, add/remove, confirm and place order.
- Responsible for loading and opening menu
- \#menu(csv)
- \#open
- \#add_item (order.add_item)
- \#remove_item (order.remove_item)
- \#review_order (order_total.current_order)
- \#confirm_order (review_order, text_confirmation)

### Order
- Responsible for adding and removing items from basket
- \#basket
- \#add_item
- \#remove_item

### Order_Total
- \#calculate_total
- \#current_order

### Confirm_Order 
- \#confirm
- \#write_order(csv) 
- \#send_text

## Features
  * [x] See a list of dishes with prices
  * [x] Select some number of several available dishes
  * [ ] Check that the total I have been given matches the sum of the various dishes in my order
  * [ ] receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  
## Bonus Features
  * [ ] Implement the ability to place orders via text message.

## Next / Homework
- 
