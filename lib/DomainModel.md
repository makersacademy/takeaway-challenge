|       Objects           |       Methods         |            Behaviour               |
|-------------------------|-----------------------|------------------------------------|
|**Menu**                 |dishes_list            |-> list of **Dishes**               |x
|                         |show                   |-> formatted str - dishes & prices  |x
|-------------------------|-----------------------|------------------------------------|
|**Dish**                 |price                  |-> returns price                    |x
|                         |name                   |-> returns name                     |x
|-------------------------|-----------------------|------------------------------------|
|**Order**                |total_price            |-> total price                      |
|                         |close                  |-> locks items, records time closed |
|                         |closed?                |-> true if order is locked          |
|                         |items                  |-> OrderItems instance              |
|                         |time                   |-> returns time at which            |
|                         |                       |   order was placed                 |
|-------------------------|-----------------------|------------------------------------|
|**OrderItems**           |add(item, n)           |-> pushes  n items to @items        |x
|                         |                       |-> raises error if item not on menu |x
|                         |remove(item, n)        |-> deletes item from @items         |
|                         |                       |-> raises error if item not in items|
|                         |lock                   |-> doesn't allow adding or removing |
|-------------------------|-----------------------|------------------------------------|
|**Restaurant**           |new_order              |-> creates new **Order** object     |
|                         |place_order            |-> @order.close                     |
|                         |notify -private        |-> sends text                       |
|-------------------------|-----------------------|------------------------------------|