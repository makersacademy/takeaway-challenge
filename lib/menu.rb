class Menu
  attr_reader :items

  DEFAULT_MENU = {
    1 => { name: 'Arbroath Smokie', cost: 6 },
    2 => { name: 'Parmigiana di Melanzane', cost: 9 }
  }

  def initialize(items = DEFAULT_MENU)
    @items = items
  end
end
