class Menu

attr_reader :our_menu, :users_order

  def initialize
    @our_menu = [{number1: 1, starter1: :soup, price: 5},
                {number2: 2, starter2: :mussels, price: 7},
                {number3: 3, starter3: :carpaccio, price: 6},
                {number4: 4, main1: :steak, price: 12},
                {number5: 5, main2: :chicken, price: 11},
                {number6: 6, main3: :salad, price: 10},
                {number7: 7, dessert1: :milktart, price: 6},
                {number8: 8, dessert2: :cheesecake, price: 7},
                {number9: 9, dessert3: :tiramisu, price: 7},
                {number10: 10, drinks1: :wine, price: 8},
                {number11: 11, drinks2: :beer, price: 5},
                {number11: 12, drinks3: :coke, price: 3}]
  @users_order = []
  end


  def make_selection(order_number, quantity)
    order1 = our_menu.values_at(order_number - 1) * quantity
    users_order << order1
    users_order.flatten! 
  end

end
