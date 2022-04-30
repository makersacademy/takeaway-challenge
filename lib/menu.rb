class Menu

attr_reader :dishes

  def initialize
    @dishes = [{order_number: 1, smoothie: "hot pea", price: 3.99},
      {order_number: 2, smoothie: "hot tomato", price: 4.25},
      {order_number: 3, smoothie: "iced broccoli", price: 4.00}
    ]
  end

  def view_menu
    @dishes
  end

end
