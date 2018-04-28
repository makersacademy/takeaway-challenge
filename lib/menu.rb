class Menu
  TAKEAWAY_MENU = [
      {
          name: 'Gagh',
          price: '5.99'
      },
      {
          name: 'Spice Melange',
          price: '10.99'
      },
      {
          name: 'Lemba Bread',
          price: '1.00'
      },
      {
          name: 'Fry\'s Worm Egg Salad Sandwich',
          price: '3.99'
      },
      {
          name: 'Pan-Galactic Gargleblaster',
          price: '0.50'
      },
      {
          name: 'White Witch\'s Turkish Delight',
          price: '1.99'
      },
      {
          name: 'Evil Ted\'s Special Cookies',
          price: '0.75'
      },
      {
          name: 'Ameglian Major Cow',
          price: '24.99'
      },
      {
          name: 'Romulan Ale',
          price: '4.99'
      }
  ]

  attr_reader :menu

  def initialize
    @menu = TAKEAWAY_MENU
  end
end
