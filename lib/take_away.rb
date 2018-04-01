class TakeAway

  attr_reader :menu
  attr_reader :basket

  def initialize
    @menu = { "Goi Ga" => 5.99, "Cha Gio" => 4.99,
    "Vietnamese dumpling" => 2.99, "peking duck" => 5.00, "Pho Bo" => 6.99 }
    @basket = []
  end

  def read_menu
    @menu
  end

  def order(dish, amount)
    basket << "#{dish} X #{amount} = £#{menu[dish] * amount}"
    "#{amount}X #{dish} added to your basket"
  end

end
