|       Objects           |       Methods         |            Behaviour               |
|-------------------------|-----------------------|------------------------------------|
|**Menu**                 |dishes                 |-> list of **Dishes**               |x
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
|                         |                       |-> raises error if item not in list |x
|                         |lock                   |-> doesn't allow adding or removing |x
|                         |list                   |-> hash of dishes(name => quantity) |
|-------------------------|-----------------------|------------------------------------|
|**Restaurant**           |menu                   |-> **Menu**                         |x
|                         |new_order              |-> creates new **Order** object     |x
|                         |place_order            |-> @order.close                     |x
|                         |pay -private           |-> pay                              |
|                         |notify -private        |-> sends text                       |
|-------------------------|-----------------------|------------------------------------|