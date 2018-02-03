class Cafe
  attr_reader :basket

  MENU = [
  { "Buckwheat Shamalam" => 5.00 },
  { "Avocado Foxtrot" => 6.50 },
  { "Crusty Snickerdoodle" => 4.50 },
  { "Froffee Coffee" => 3.50 },
  { "Realitea" => 2.00 },
  { "Mystery Item" => 10.00 }
]

  def initialize
    @basket = []
  end

  def print_menu
    MENU
  end

  def add(customer_choice)
    MENU.each { |item| item.each_key do |key, _value|
      if customer_choice == key
        @basket << "#{key}"
      end
    end
    }
    return @basket.inject(Hash.new(0)) { |total, x| total[x] += 1; total }
  end

  def total_items
    @basket.count
  end
end
