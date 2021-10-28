class Order():
    
    def __init__(self, last=None):
        self.basket = {}
        
    def add_to_basket(self, item, quantity):
        self.basket[item] = quantity
        

    