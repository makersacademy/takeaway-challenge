class Restaurant
  attr_reader :menu, :dish_class

  SAVED_MENU = [
    { name: 'Tom yum soup', price: 4.50 },
    { name: 'Pad thai', price: 8.95 },
    { name: 'Pad see yiew', price: 8.95 },
    { name: 'Egg fried rice', price: 3.89 }
  ]

  def initialize(dish_class = 'Dish')
    @menu = []
    @dish_class = dish_class
    setup_menu
  end

  private

  def setup_menu
    SAVED_MENU.each do |dish|
      @menu << create_dish(dish[:name], dish[:price])
    end
  end

  def create_dish(name, price)
    @dish_class.new(name, price)
  end


end