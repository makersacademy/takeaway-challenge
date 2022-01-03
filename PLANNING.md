# What messages will this app be sending? (Behaviour)
| Message                             | To Object?
--------------------------------------|------------------
| * accessor: menu                    | restaurant
| * accessor: basket                  | basket
| * .see_menu                         | restaurant
| * .add_menu_item_to_basket(number)  | restaurant
| * .check_order_total_against_items  | basket (private method?)
| * .confirm_order(basket)            | restaurant
| * .send_text (private method?)      | restaurant OR confirmation class??








# Domains (potential classes)
* Restaurant
* Menu
* Basket
