#I'm unsure if this is the simplest way to import classes
from takeaway.takeaway import Takeaway
from takeaway.order import Order
import pytest

def test_menu():
    #This is testing state rather than behaviour, but I'm puzzled how I can test
    #the menu output
    assert len(Takeaway.menu) == 3

def test_order():
    order_1 = Order()
    order_1.add_to_basket('chicken fried rice', 1)
    assert 'chicken fried rice' in order_1.basket

def test_checkout():
    order_1 = Order()
    order_1.add_to_basket('chicken fried rice', 1)
    order_1.add_to_basket('sweet and sour chicken', 2)
    order_1.checkout()
    assert order_1.checkout_total == 13.9

def test_checkout_fails_if_already_checked_out():
    order_1 = Order()
    order_1.add_to_basket('chicken fried rice', 1)
    order_1.checkout()
    #Is this a succinct way to test errors?
    with pytest.raises(NameError, match='You have already checked out'):
        obj = order_1.checkout() 

    