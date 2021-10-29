from bm-takeaway-makers.takeaway import Takeaway

class Order():
    
    def __init__(self):
        self.basket = {}
        self.checkout_total = 0
        self.order_finalised = False
        
    def add_to_basket(self, item, quantity):
        #Is this a good one line format for a guard clause?
        if self.order_finalised: raise Exception('Order is complete')
        self.basket[item] = quantity
        
    def cost(self):
        #Struggling to understand how I can test a class that purely prints
        #something to CLI, similar to Takeaway.show_menu function
        cost_so_far = 0
        for k, v in self.basket.items():
            cost_so_far += (Takeaway.menu[k] * v)
        print("Total to pay so far: %s" % cost_so_far)

    def checkout(self):
        if not self.basket: raise Exception('Nothing in basket')
        if self.order_finalised: raise Exception('You have already checked out')
        for k, v in self.basket.items():
            self.checkout_total += (Takeaway.menu[k] * v)
        self.order_finalised = True