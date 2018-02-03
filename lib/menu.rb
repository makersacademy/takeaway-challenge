class Menu
  attr_reader :basket

  MENU = [
  { "Buckwheat Shamalam" => 5.00 },
  { "Avocado Foxtrot" => 6.50 },
  { "Spinach Snickerdoodle" => 4.50 },
  { "Froffee Coffee" => 3.50 },
  { "Entitea" => 2.00 },
  { "Mystery Item" => 10.00 }
]

  def initialize
    @basket = []
  end

  def print_menu
    MENU.each { |item| item.each do |key, value|
      puts "#{key}, " + '%.2f' % value
    end
    }
  end

  def add_to_basket(menu_item)
    MENU.each { |item| item.each do |key, value|
      if menu_item == key
        @basket << "#{key}, " + '%.2f' % value.to_s
      end
    end
    }
  end
end
