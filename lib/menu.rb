class Menu 
  attr_reader :list

  def initialize
    @list = [
    { dish: 'Shio Ramen', price: 5 },
    { dish: 'Shoyu Ramen', price: 6 },
    { dish: 'Miso Ramen', price: 7 },
    { dish: 'Spicy Ramen', price: 8 }
    ]
  end

  def see
    @list
  end
end
