class Menu

  attr_reader :items

MENU = {"spring roll"=>0.99,
  "char sui bun"=>3.99,
  "pork dumpling"=>2.99,
  "peking duck"=>7.99,
  "fu-king fried rice"=>5.99}


def initialize(items = MENU)
  @items = items
end

end
