class Menu

  attr_reader :menu

  def initialize
    @menu = [{ name: 'burger', price: 5 },
    { name: 'chicken', price: 5 },
    { name: 'chips', price: 3 },
    { name: 'pizza', price: 7 },
    { name: 'nachos', price: 3 },
    { name: 'sweet potato fries', price: 4 },
    { name: 'veggie burger', price: 5 }]
  end

  def show
    @menu
  end
end
