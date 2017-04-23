class List
  attr_reader :dishes

  def initialize

    @dishes = [
      { 1 => 'Chow Mein', :Price => 5.99 },
      { 2 => 'Crispy shredded beef', :Price => 6.99 },
      { 3 => 'Supreme Mega Deluxe Royale Meal', :Price => 399.99 }
    ]

  end
end
