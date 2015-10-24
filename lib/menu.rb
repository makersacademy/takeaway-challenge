class Menu

attr_reader :dishes

def initialize
  @dishes = {}
end

def add_dish(name,price)
  @dishes[name] = price
  @dishes
end

def remove_dish(name)
  @dishes.delete_if{|key,value| key == name}
end

def display_menu
  menu = ""
  @dishes.each{|key,value| menu = menu + "#{key}: £#{value}, "}
  menu.chomp(", ")
end

end
