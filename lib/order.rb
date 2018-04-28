class Order

def initialize
  @items = Hash.new
end

def read_menu
  menu.list_dishes
end

def add_dish(dish, quantity = 1)
  @items[dish] += quantity
end

def view_basket
end

def checkout
end
