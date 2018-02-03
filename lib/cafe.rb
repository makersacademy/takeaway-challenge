class Cafe
  attr_reader :basket, :total

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
    @total = []
  end

  def print_menu
    return MENU
  end

  def add(customer_choice)
    MENU.each { |item| item.each do |key, value|
      if customer_choice == key
        @basket << "#{key}"
        @total << value
      end
    end
    }
    return @basket.inject(Hash.new(0)) { |total, x| total[x] += 1; total }
  end

  def price
    total.inject(0, :+)
  end
end
