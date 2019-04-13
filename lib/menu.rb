require_relative 'takeaway'

class Menu

  def intialize
  end

  def show
    "|MAINS|: #{main_list} |
    |SIDES|: #{sides_list} |
    |DRINKS|: #{drinks_list} |"
  end

  private

  MAINS = {'Lamb Nihari' => 8.00, 'Haleem' => 9.00,
            'Chicken Karahi' => 6.00, 'Biryani' => 5.00}

  SIDES = {'Plain naan' => 1.20, 'Garlic naan' => 1.80,
            'Chutney' => 0.50, 'Rice' => 2.50}

  DRINKS = {'Mango lassi' => 1.65, 'Coke' => 0.60,
            'Fanta' => 0.60, 'Water' => 1.20}

  def main_list
    MAINS.collect { |key, value| "#{key}: #{value}" }.join(", ")
  end

  def sides_list
    SIDES.collect { |key, value| "#{key}: #{value}" }.join(", ")
  end

  def drinks_list
    DRINKS.collect { |key, value| "#{key}: #{value}" }.join(", ")
  end

end
