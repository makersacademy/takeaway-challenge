|       Objects           |       Methods         |       Behaviour               |
|-------------------------|-----------------------|-------------------------------|
|**Menu**                 |dishes_list            |-> list of Dishes              |
|                         |show                   |-> formatted string of dishes  |
|**Dish**                 |price                  |-> returns price               |
|                         |name                   |-> returns name                |
|**Order**                |total_price            |-> int sum(prices)             |
|                         |items                  |-> Array of **dishes**         |
|**Restaurant**           |new_order              |-> creates new **Order** object|
|                         |place_order            |-> @order.close                |
|                         |notify -private        |-> sends text                  |