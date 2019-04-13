class Menu

  MAINS = [ {dish: 'Nihari', price: 8}, {dish: 'Haleem', price: 9},
            {dish: 'Rogan josh', price: 6} ]

  # SIDES = [ {side: 'Plain naan', price: 1}, {side: 'Garlic naan', price: 2},
  #           {side: 'Chutney', price: 0.50 }]
  #
  # DRINKS = [ {drink: 'Mango lassi', price: 1.50}, {drink: 'Coke 250ml', price: 0.60},
  #           {drink: 'Water', price: 0.80 }]

  def show
    main_list
  end

  private

  def main_list
    MAINS.collect { |dish| "#{dish[:dish]}: " "£#{dish[:price].to_f}" }.join(", ")
  end

  # def sides_list
  #   SIDES.collect { |dish| "#{dish[:side]}: " "£#{dish[:price].to_f}" }
  # end
  #
  # def drinks_list
  #   DRINKS.collect { |drink| "#{drink[:drink]}: " "£#{drink[:price].to_f}" }
  # end

  # def price(str)                     intended to take out price when given
  #   DISHES[str] || DISHES.key(str)     string ie dish.
  # end

end
