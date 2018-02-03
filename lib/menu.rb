class Menu
  attr_reader :basket

  MENU = [
  { "1. Buckwheat Shamalam" => 5.00 },
  { "2. Avocado Foxtrot" => 6.50 },
  { "3. Spinach Snickerdoodle" => 4.50 },
  { "4. Froffee Coffee" => 3.50 },
  { "5. Entitea" => 2.00 },
  { "6. Mystery Item" => 10.00 }
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
end
