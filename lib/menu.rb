class Menu

    attr_reader :our_menu, :users_order

    def initialize
        @our_menu = [{number0: 0, starter1: :soup, price: 5},
                {numbe1: 1, starter2: :mussels, price: 7},
                {number2: 2, starter3: :carpaccio, price: 6},
                {number3: 3, main1: :steak, price: 12},
                {number4: 4, main2: :chicken, price: 11},
                {number5: 5, main3: :salad, price: 10},
                {number6: 6, dessert1: :milktart, price: 6},
                {number7: 7, dessert2: :cheesecake, price: 7},
                {number8: 8, dessert3: :tiramisu, price: 7},
                {number9: 9, drinks1: :wine, price: 8},
                {number10: 10, drinks2: :beer, price: 5},
                {number11: 11, drinks3: :coke, price: 3}]
       @users_order = []
  end


  def make_selection(order_number, quantity)
      order1 = our_menu.values_at(order_number)
      order1.last[:quantity] = quantity
      (users_order << order1).flatten!.last
  end

end
