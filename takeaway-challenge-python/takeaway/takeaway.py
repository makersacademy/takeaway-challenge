class Shop:

    menu = { 
        'chicken fried rice' : 3.50,
        'crispy shredded beef' : 4.50,
        'sweet and sour chicken' : 5.20
        }

    def show_menu(self):
        for key, v in Shop.menu.items():
            print('%s: %s' % (key, v))
