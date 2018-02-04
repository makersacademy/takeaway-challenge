class Menu

  attr_reader :items,
              :shopping_cart,
              :display

  def initialize(display=Display.new)
    @items = { 'hu soup' => '4.99' }
    @shopping_cart = []
    @display = items
  end
end
