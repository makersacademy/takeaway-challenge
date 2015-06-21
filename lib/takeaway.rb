class Takeaway


DISHES = {:bacon => 2.50,
          :cheese => 1.00,
          :pizza => 5.00,
          :cake => 4.32,
          :carrots => 1.20,
          :pie => 2.00}

def initialize
  @order = []
end

def view_dishes
  DISHES
end

def select_dish dish, quantity
  fail 'dish not on menu' unless on_menu? dish
  @order << [dish, quantity]
end

def on_menu? dish
  DISHES.has_key?(dish)
end

def order_value
  DISHES[@order[0][0]]
end

end