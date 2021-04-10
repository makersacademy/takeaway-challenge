class Menu
  attr_reader :menu, :basket
  def initialize
    @basket = []
  end
  def list
    @menu = [
      { name: 'German Burger', price: '£12,70' },
      { name: 'Chips', price: '£2.50' }
    ]
  end

  def add_dish(select, number)
    @basket << { name: select, number: number }
  end
end
