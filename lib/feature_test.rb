MENU = [
        {name: 'sushi', price: 12},
        {name: 'ramen', price: 7},
        {name: 'soup', price: 4.5},
        {name: 'fish and chips', price: 10},
        {name: 'bread', price: 3},
        {name: 'olives', price: 1.5}
        ]

# extract correct dish on the menu given a name of the dish
p MENU.select {|item| (item[:name] == 'soup') || (item[:name] == 'bread') }
