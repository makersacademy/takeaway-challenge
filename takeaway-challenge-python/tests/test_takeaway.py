from bm_takeaway_makers.takeaway import Takeaway
from bm_takeaway_makers.order import Order
from bm_takeaway_makers.text import Text
from unittest.mock import patch
import pytest
#I'm unsure if this is the simplest way to import classes

def test_menu():
    #This is testing state rather than behaviour, but I'm puzzled how I can test
    #the menu output
    assert len(Takeaway.menu) == 3

def test_order():
    order_1 = Order()
    order_1.add_to_basket('chicken fried rice', 1)
    assert 'chicken fried rice' in order_1.basket

#mocking the text.send_text method so it doesn't attempt to send a text during 
#testing
@patch.object(Text, 'send_text')
def test_checkout(send_text):
    send_text.return_value = ''
    order_1 = Order()
    order_1.add_to_basket('chicken fried rice', 1)
    order_1.add_to_basket('sweet and sour chicken', 2)
    order_1.checkout()
    assert order_1.checkout_total == 13.9

@patch.object(Text, 'send_text')
def test_checkout_fails_if_already_checked_out(send_text):
    send_text.return_value = ''
    order_1 = Order()
    order_1.add_to_basket('chicken fried rice', 1)
    order_1.checkout()
    #Is this a succinct way to test errors?
    with pytest.raises(Exception, match='You have already checked out'):
        order_1.checkout() 

@patch.object(Text, 'send_text')
def test_cannot_add_to_basket_after_checkout(send_text):
    send_text.return_value = ''
    order_1 = Order()
    order_1.add_to_basket('chicken fried rice', 1)
    order_1.checkout()
    with pytest.raises(Exception, match='Order is complete'):
        order_1.add_to_basket('chicken fried rice', 1)
    
@patch.object(Text, 'send_text')
def test_cannot_checkout_if_nothing_in_basket(send_text):
    send_text.return_value = ''
    order_1 = Order()
    with pytest.raises(Exception, match='Nothing in basket'):
        order_1.checkout()

#additional tests to test the Text class?