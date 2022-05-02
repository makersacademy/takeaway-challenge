class Menu
attr_reader :dishes

  def initialize
    @dishes = [
      {name: 'Cacio e pepe', price: 10},
      {name: 'Alla Gricia', price: 11.50},
      {name: 'Carbonara', price: 12},
      {name: 'Amaracitiana', price: 11}

    ]
  end

end