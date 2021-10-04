class Order

def initialze(menu)
    @basket = []
    @menu = menu
end

def add_dishes(item)
 @basket << item
end

end