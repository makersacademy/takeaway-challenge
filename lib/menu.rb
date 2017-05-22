class Menu

  attr_reader :dishes, :basket

  def initialize
    @dishes = [{ "edemame" => 5.00 },
               { "chirashi" => 11.95 },
               { "salmon nigiri" => 5.50 },
               { "california rolls" => 6.75 },
               { "miso soup" => 2.00 },
               { "dorayaki" => 3.50 },
               { "mochi" => 3.50 }]
    @basket = []
  end

  def show_menu
    @dishes.each { |item| item.map { |name, price| puts "#{name}, #{price}" } }
  end

  def order_item(list_number, quantity)
    quantity.times { @basket << @dishes[list_number - 1] }
    "You added #{quantity} portion(s) of #{@dishes[list_number - 1].keys[0]} to your basket!"
  end
  
end
