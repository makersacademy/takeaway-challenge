|       Objects           |       Methods         |            Behaviour               |
|-------------------------|-----------------------|------------------------------------|
|**Menu**                 |dishes_list            |-> list of **Dishes**               |x
|                         |show                   |-> formatted str - dishes & prices  |x
|-------------------------|-----------------------|------------------------------------|
|**Dish**                 |price                  |-> returns price                    |x
|                         |name                   |-> returns name                     |x
|-------------------------|-----------------------|------------------------------------|
|**Order**                |total_price            |-> total price                      |
|                         |time                   |-> returns time at which            |
|                         |                       |   order was placed                 |
|                         |checkout               |-> locks items, records time closed |x
|                         |checked_out?           |-> true if checked out              |x
|                         |items                  |-> OrderItems instance              |x
|-------------------------|-----------------------|------------------------------------|
|**OrderItems**           |add(item, n)           |-> pushes  n items to @items        |x
|                         |                       |-> raises error if item not on menu |x
|                         |remove(item, n)        |-> deletes item from @items         |x
|                         |                       |-> raises error if item not in items|x
|                         |lock                   |-> doesn't allow adding or removing |x
|                         |list                   |-> hash of dishes(name => quantity) |
|-------------------------|-----------------------|------------------------------------|
|**Restaurant**           |menu                   |-> **Menu**                         |
|                         |new_order              |-> creates new **Order** object     |
|                         |place_order            |-> @order.close                     |
|                         |notify -private        |-> sends text                       |
|-------------------------|-----------------------|------------------------------------|