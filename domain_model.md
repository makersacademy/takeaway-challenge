Objects and messages
==================

DISHES
------
@data

This class responsibility: "It allows to: structure unstructured data source"


MENU
------
view
choose(dish)

This class responsibility: "It allows to: view and choose dishes specifing their quantity from a data source, and add them to a an order"

ORDER
------
add(dish, 1)
review
place

This class responsibility: "It allows to: store added dishes, calculate total, review and place the order"





IRB manual testing
==================

menu = Menu.new(Dishes.new)

menu.view

order.add(menu.choose(dish, 1))

order.review

order.place
