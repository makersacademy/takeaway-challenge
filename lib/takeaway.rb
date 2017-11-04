# Order class for takeaway challenge
class TakeAway
  attr_reader :menu_options, :sum_total, :quantity, :chosen_meal

  def initialize
    @basket_sumarry = []
    @sum_total = 0
  end

  def menu_options
    { 'Miso Soup' => 1.50, 'Saitan' => 2.50, 'Tofu Steak' => 3.00 }
  end

  def list_of_dishes
    n = 0
    menu_options.each do |meal, value|
      puts "#{n += 1}. #{meal} > #{value}"
    end
  end

  def order(chosen_meal, quantity=1)
    @sum_total += menu_options[chosen_meal] * quantity.to_i
    add_to_basket
    printe_message
  end

  def add_to_basket
    @basket_summary << "#{quantity} of #{chosen_meal}"
  end

  def print_message
    print "x #{quantity} #{chosen_meal} added to your basket."
  end

  def basket_sumarry
    @basket_summary.each do |meal, quantity|
      p "#{quantity} of #{meal},"
    end
  end

end
