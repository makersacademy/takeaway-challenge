class Menu
  attr_reader :menu

  menu = [
    {item: 'Mighty bucket (10 pieces of chicken breast strips)', price: 12},
    {item: 'Hot wings (2 wings in one portion)', price: 1},
    {item: 'Chicken burger', price: 6},
    {item: 'Fries (small)', price: 3},
    {item: 'Fries large', price: 4},
    {item: 'Drinks 330ml (coke, fanta, sprite, water)', price: 2}
  ]

  def initiliaze(menu = list_of_items)
    @menu = list_of_items
  end

  def read
    @menu.each do |item, price|
      print "#{item}: £#{price}"
    end
  end
end
