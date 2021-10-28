from takeaway.takeaway import Takeaway

class Order():
    
    def __init__(self):
        self.basket = {}
        self.checkout_total = 0
        self.order_finalised = False
        
    def add_to_basket(self, item, quantity):
        #Is this a good one line format for a guard case?
        if self.order_finalised: raise Exception('Order is complete')
        self.basket[item] = quantity
        
    def checkout(self):
        if not self.basket: raise Exception('Nothing in basket')
        if self.order_finalised: raise Exception('You have already checked out')
        for k, v in self.basket.items():
            self.checkout_total += (Takeaway.menu[k] * v)
        print("Total to pay: %s" % self.checkout_total)
        self.order_finalised = True