def add(dish, quantity)
    order = {}
    order.has_key(dish) ? order[dish] += quanity : order.merge!(dish => quantity)  
    p order
end
add("rice", 3)
