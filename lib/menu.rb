class Menu
  attr_reader :current_menu

  def initialize
    @current_menu = [
      {
        category: 'Starters',
        name: 'HFC 6 Hotwings Meal',
        price: 5.00,
        description: 'comes with 6 wings, served with a regular drink and fries'
      },
      {
        category: 'Mains',
        name: 'Fish & Chips',
        price: 28.45,
        description: 'served with chunky chips and tomato sauce'
      },
      {
        category: 'Desert',
        name: 'Chocolate Brownie with Ice Cream',
        price: 5.95,
        description: 'served with hazelnut ice cream'
      },
      {
        category: 'Sides',
        name: 'Tossed Salad',
        price: 3.50,
        description: 'served with a light drizzling of balsamic vinegar'
      }
    ]
  end

  def display_menu
    @current_menu
  end
end
