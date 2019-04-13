class Order

#attribute reader
def select_dish
  @select_dish
end

def initialize
  @select_dish = []
end

def add_selected_dish(name)
  @select_dish << name
end

end
