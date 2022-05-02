class Menu

attr_reader :dishes

  def initialize
    @dishes = [{order_number: 1, smoothie: "hot pea", price: 3.99, available: true},
      {order_number: 2, smoothie: "hot tomato", price: 4.25, available: true},
      {order_number: 3, smoothie: "iced broccoli", price: 4.00, available: false}
    ]
  end

  def view_menu
    @dishes
  end
end
