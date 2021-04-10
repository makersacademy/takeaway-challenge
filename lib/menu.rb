class Menu
  attr_reader :menu

  def list
    @menu = [
      { name: 'German Burger', price: '£12,70' },
      { name: 'Chips', price: '£2.50' }
    ]
  end
end
