require_relative 'takeaway'

class Menu

  MAINS = {'Lamb Nihari' => 8.00, 'Haleem' => 9.00,
            'Chicken Karahi' => 6.00, 'Biryani' => 5.00}

  SIDES = {'Plain naan' => 1.20, 'Garlic naan' => 1.80,
            'Chutney' => 0.50, 'Rice' => 2.50}

  DRINKS = {'Mango lassi' => 1.65, 'Coke' => 0.60,
            'Fanta' => 0.60, 'Water' => 1.20}

  attr_reader :items

  # def intialize
  #   @items = {}
  # end

  def show
    "|MAINS|: #{main_list} |
    |SIDES|: #{sides_list} |
    |DRINKS|: #{drinks_list} |"
  end

  private

  def main_list
    MAINS.collect { |item, price| "#{item}: £#{price}0" }.join(", ")
  end

  def sides_list
    SIDES.collect { |item, price| "#{item}: £#{price}0" }.join(", ")
  end

  def drinks_list
    DRINKS.collect { |item, price| "#{item}: £#{price}0" }.join(", ")
  end

end
