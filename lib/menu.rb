class Menu

attr_reader :dishes

def initialize
  @dishes = {
    "kebab" => 3,
    "burger" => 4,
    "fries" => 2,
    "shake" => 2.5
  }
end

def view_menu
  @dishes.each{|dish, price| puts "#{dish} -- £#{price}"}
  [@dishes]
end

def add_item_to_menu(item, price=0)
  @dishes[item] = 0 unless @dishes[price]
  @dishes[item] += price
end

end
