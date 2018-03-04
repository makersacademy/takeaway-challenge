class Menu
  attr_reader :current_menu

  # move current menu into seperate csv file
  CURRENT_MENU = [
    {
      category: 'Starters',
      name: 'HFC 6 Hotwings Meal',
      price: 5.00,
      description: 'includes 6 wings, served with a regular drink and fries',
      quantity: 0
    },
    {
      category: 'Mains',
      name: 'Fish & Chips',
      price: 28.45,
      description: 'served with chunky chips and tomato sauce',
      quantity: 0
    },
    {
      category: 'Desert',
      name: 'Chocolate Brownie with Ice Cream',
      price: 5.95,
      description: 'served with hazelnut ice cream',
      quantity: 0
    },
    {
      category: 'Sides',
      name: 'Tossed Salad',
      price: 3.50,
      description: 'served with a light drizzling of balsamic vinegar',
      quantity: 0
    }
  ]

  def initialize
    @current_menu = CURRENT_MENU
  end
end
