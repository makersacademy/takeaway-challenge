class Takeaway:

    menu = { 
            'chicken fried rice' : 3.50,
            'crispy shredded beef' : 4.50,
            'sweet and sour chicken' : 5.20
        }

    def show_menu(self):
        for item, price in Shop.menu.items():
            print('%s: %s' % (item, price))
