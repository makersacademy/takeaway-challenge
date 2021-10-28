#I'm unsure if this is the simplest way to import classes
from takeaway.takeaway import Takeaway
from takeaway.order import Order

def test_menu():
    #This is testing state rather than behaviour, but I'm puzzled how I can test
    #the menu output
    assert len(Takeaway.menu) == 3

def test_order():
    order_1 = Order()
    order_1.add_to_basket('chicken fried rice', 1)
    assert 'chicken fried rice' in order_1.basket